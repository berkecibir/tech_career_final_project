import 'package:tc_bootcamp_final/feat/data/model/cart/cart_product_model.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';

abstract class CartRepository {
  Future<void> addProductToCart({
    required ProductModel product,
    required int quantity,
    required String userName,
  });
  Future<List<CartProductModel>> getCartProducts({required String userName});
  Future<void> deleteProductFromCart({
    required int sepetId,
    required String userName,
  });
  Future<void> clearCart({required String userName});
}
