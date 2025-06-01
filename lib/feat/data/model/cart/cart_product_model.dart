import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';

class CartProductModel extends ProductModel {
  final int quantity;
  const CartProductModel({
    required super.id,
    required super.name,
    required super.image,
    required super.category,
    required super.price,
    required super.brand,
    required this.quantity,
  });

  factory CartProductModel.fromProduct({
    required ProductModel product,
    required int quantity,
  }) {
    return CartProductModel(
      id: product.id,
      name: product.name,
      image: product.image,
      category: product.category,
      price: product.price,
      brand: product.brand,
      quantity: quantity,
    );
  }

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: int.parse(json[AppTexts.sepetId].toString()),
      name: json[AppTexts.name],
      image: json[AppTexts.image],
      category: json[AppTexts.category],
      price: int.parse(json[AppTexts.price].toString()),
      brand: json[AppTexts.brand],
      quantity: int.parse(json[AppTexts.quantity].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppTexts.sepetId: id.toString(),
      AppTexts.name: name,
      AppTexts.image: image,
      AppTexts.category: category,
      AppTexts.price: price.toString(),
      AppTexts.brand: brand,
      AppTexts.quantity: quantity.toString(),
    };
  }

  CartProductModel copyWith({
    int? id,
    String? name,
    String? image,
    String? category,
    int? price,
    String? brand,
    int? quantity,
  }) {
    return CartProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      category: category ?? this.category,
      price: price ?? this.price,
      brand: brand ?? this.brand,
      quantity: quantity ?? this.quantity,
    );
  }
}
