import 'package:tc_bootcamp_final/feat/data/model/cart/cart_response.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';

abstract class CartService {
  Future<void> addProductToCard({
    required ProductModel product,
    required int quantity,
    required String userName,
  });
  Future<CartResponse> getCartProducts({required String userName});
  Future<void> deleteProductFromCart({
    required int sepetId,
    required String userName,
  });
  Future<void> clearCart({required String userName});
}
