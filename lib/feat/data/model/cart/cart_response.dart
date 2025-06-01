import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/data/model/cart/cart_product_model.dart';

class CartResponse {
  final List<CartProductModel> cartProducts;
  final int success;
  final String? message;

  CartResponse({
    required this.cartProducts,
    required this.success,
    required this.message,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    var success = json[AppTexts.success] as int;
    var message = json[AppTexts.message] as String?;
    var jsonArray = json[AppTexts.products] as List?;

    List<CartProductModel> cartProducts = [];
    if (jsonArray != null) {
      cartProducts = jsonArray
          .map(
            (item) => CartProductModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    }
    return CartResponse(
      cartProducts: cartProducts,
      success: success,
      message: message,
    );
  }
}
