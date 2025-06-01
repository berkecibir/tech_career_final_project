import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tc_bootcamp_final/feat/cubit/cart/cart_state.dart';
import 'package:tc_bootcamp_final/feat/data/model/cart/cart_product_model.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';
import 'package:tc_bootcamp_final/feat/data/repo/cart/cart_repository.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository repository;

  CartCubit(this.repository) : super(CartInitial());

  final String defaultUserName = AppTexts.defaultUserName;

  Future<void> addProductToCart({
    required ProductModel product,
    required int quantity,
    required String userName,
  }) async {
    emit(CartActionLoading());
    try {
      await repository.addProductToCart(
        product: product,
        quantity: quantity,
        userName: userName,
      );
      emit(CartActionSuccess());

      await getCartProducts(userName: userName);
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> getCartProducts({required String userName}) async {
    emit(CartLoading());
    try {
      final products = await repository.getCartProducts(userName: userName);
      double total = 0;
      for (var p in products) {
        total += p.price * p.quantity;
      }
      emit(CartLoaded(products, total));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> deleteProductFromCart({
    required int sepetId,
    required String userName,
  }) async {
    emit(CartActionLoading());
    try {
      await repository.deleteProductFromCart(
        sepetId: sepetId,
        userName: userName,
      );
      emit(CartActionSuccess());
      await getCartProducts(userName: userName);
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> clearCart({required String userName}) async {
    emit(CartActionLoading());
    try {
      await repository.clearCart(userName: userName);
      emit(CartActionSuccess());
      await getCartProducts(userName: userName);
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> updateCartItemQuantity({
    required CartProductModel cartProduct,
    required int newQuantity,
    required String userName,
  }) async {
    emit(CartActionLoading());
    try {
      await repository.deleteProductFromCart(
        sepetId: cartProduct.id,
        userName: userName,
      );

      if (newQuantity > 0) {
        final productToReAdd = ProductModel(
          id: cartProduct.id,
          name: cartProduct.name,
          image: cartProduct.image,
          category: cartProduct.category,
          price: cartProduct.price,
          brand: cartProduct.brand,
        );
        await repository.addProductToCart(
          product: productToReAdd,
          quantity: newQuantity,
          userName: userName,
        );
      }
      emit(CartActionSuccess());
      await getCartProducts(userName: userName);
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
}
