import 'package:tc_bootcamp_final/feat/data/model/cart/cart_product_model.dart';

abstract class CartState {
  const CartState();

  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartProductModel> cartProducts;
  final double totalPrice;

  const CartLoaded(this.cartProducts, this.totalPrice);

  @override
  List<Object?> get props => [cartProducts, totalPrice];
}

class CartActionLoading extends CartState {}

class CartActionSuccess extends CartState {}

class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}
