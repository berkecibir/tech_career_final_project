import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';

class ProductResponse {
  final List<ProductModel> products;
  final int success;

  ProductResponse({required this.products, required this.success});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    var productList = json[AppTexts.productsForHomePage] as List;
    List<ProductModel> productsForHomePage = productList
        .map((i) => ProductModel.fromJson(i))
        .toList();

    return ProductResponse(
      products: productsForHomePage,
      success: json[AppTexts.success] ?? 0,
    );
  }
}
