import 'package:tc_bootcamp_final/feat/data/model/product/product_response.dart';

abstract class ProductService {
  Future<ProductResponse> getAllProducts();
}
