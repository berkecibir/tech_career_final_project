import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getAllProducts();
}
