import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';

class ProductModel {
  final int id;
  final String name;
  final String image;
  final String category;
  final int price;
  final String brand;

  const ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.price,
    required this.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: int.parse(json[AppTexts.id].toString()),
      name: json[AppTexts.name],
      image: json[AppTexts.image],
      brand: json[AppTexts.brand],
      category: json[AppTexts.category],
      price: int.parse(json[AppTexts.price].toString()),
    );
  }
}
