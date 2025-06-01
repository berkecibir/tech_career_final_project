import 'package:tc_bootcamp_final/feat/core/exception/product_exception.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/data/model/cart/cart_product_model.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';
import 'package:tc_bootcamp_final/feat/data/repo/cart/cart_repository.dart';
import 'package:tc_bootcamp_final/feat/data/service/cart/cart_service.dart';

class CartRepositoryImpl implements CartRepository {
  final CartService _cartService;

  CartRepositoryImpl({required CartService cartService})
    : _cartService = cartService;
  @override
  Future<void> addProductToCart({
    required ProductModel product,
    required int quantity,
    required String userName,
  }) async {
    try {
      await _cartService.addProductToCard(
        product: product,
        quantity: quantity,
        userName: userName,
      );
    } catch (e) {
      throw ProductException('${AppTexts.errorInRepository} $e');
    }
  }

  @override
  Future<void> clearCart({required String userName}) async {
    try {
      await _cartService.clearCart(userName: userName);
    } catch (e) {
      throw ProductException('${AppTexts.errorInRepository} $e');
    }
  }

  @override
  Future<void> deleteProductFromCart({
    required int sepetId,
    required String userName,
  }) async {
    try {
      await _cartService.deleteProductFromCart(
        sepetId: sepetId,
        userName: userName,
      );
    } catch (e) {
      throw ProductException('${AppTexts.errorInRepository} $e');
    }
  }

  @override
  Future<List<CartProductModel>> getCartProducts({
    required String userName,
  }) async {
    try {
      final response = await _cartService.getCartProducts(userName: userName);
      if (response.success == 1) {
        return response.cartProducts;
      } else {
        return [];
      }
    } catch (e) {
      throw ProductException('${AppTexts.errorInRepository} $e');
    }
  }
}
