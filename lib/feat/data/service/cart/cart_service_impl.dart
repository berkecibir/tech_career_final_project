import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/exception/product_exception.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/data/model/cart/cart_response.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';
import 'package:tc_bootcamp_final/feat/data/service/cart/cart_service.dart';

class CartServiceImpl implements CartService {
  final Dio _dio = Dio();

  @override
  Future<void> addProductToCard({
    required ProductModel product,
    required int quantity,
    required String userName,
  }) async {
    const url = "http://kasimadalan.pe.hu/urunler/sepeteUrunEkle.php";
    try {
      final formData = FormData.fromMap({
        AppTexts.name: product.name,
        AppTexts.image: product.image,
        AppTexts.category: product.category,
        AppTexts.price: product.price.toString(),
        AppTexts.brand: product.brand,
        AppTexts.quantity: quantity.toString(),
        AppTexts.userName: userName,
      });
      final response = await _dio.post(url, data: formData);
      debugPrint("${AppTexts.cartResponseStatusCode} ${response.statusCode}");
      debugPrint("${AppTexts.cartResponseData} ${response.data}");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data is String
            ? jsonDecode(response.data)
            : response.data;
        if (responseData[AppTexts.success] != 1) {
          throw ProductException(
            '${AppTexts.addToCartError} - ${responseData[AppTexts.message]}',
          );
        }
      } else {
        throw ProductException(AppTexts.addToCartServerError);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint("${AppTexts.cartDioErrorResponse} ${e.response?.data}");
        debugPrint(
          "${AppTexts.cartDioErrorResponseStatusCode} ${e.response?.statusCode}",
        );
        throw ProductException(
          '${AppTexts.addToCartServerError} - ${AppTexts.dioErrorResponse} ${e.response?.statusCode ?? 'Unknown'}',
        );
      } else {
        throw ProductException(
          '${AppTexts.addToCartError} - ${AppTexts.networkError} ${e.message}',
        );
      }
    } catch (e) {
      throw ProductException('${AppTexts.addToCartError} $e');
    }
  }

  @override
  Future<CartResponse> getCartProducts({required String userName}) async {
    final url = "http://kasimadalan.pe.hu/urunler/sepettekiUrunleriGetir.php";
    try {
      final formData = FormData.fromMap({AppTexts.userName: userName});

      final response = await _dio.post(url, data: formData);

      debugPrint(
        "${AppTexts.getCartResponseStatusCode} ${response.statusCode}",
      );
      debugPrint("${AppTexts.getCartResponseData} ${response.data}");

      if (response.statusCode == 200) {
        if (response.data == null ||
            (response.data is String &&
                (response.data as String).trim().isEmpty)) {
          return CartResponse(
            cartProducts: [],
            success: 0,
            message: AppTexts.cartResponseMessage,
          );
        }

        try {
          final Map<String, dynamic> responseData = response.data is String
              ? jsonDecode(response.data)
              : response.data;
          return CartResponse.fromJson(responseData);
        } catch (e) {
          throw ProductException(
            '${AppTexts.getCartError} - ${AppTexts.jsonResponseFailed} $e',
          );
        }
      } else {
        throw ProductException(AppTexts.getCartServerError);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint("${AppTexts.cartResponseData} ${e.response?.data}");
        debugPrint(
          "${AppTexts.cartResponseStatusCode} ${e.response?.statusCode}",
        );
        throw ProductException(
          '${AppTexts.getCartServerError} - ${AppTexts.dioError} ${e.response?.statusCode ?? AppTexts.unknown}',
        );
      } else {
        throw ProductException(
          '${AppTexts.getCartError} - ${AppTexts.networkError} ${e.message}',
        );
      }
    } catch (e) {
      throw ProductException('${AppTexts.getCartError} $e');
    }
  }

  @override
  Future<void> deleteProductFromCart({
    required int sepetId,
    required String userName,
  }) async {
    const url = "http://kasimadalan.pe.hu/urunler/sepettenUrunSil.php";
    try {
      final formData = FormData.fromMap({
        AppTexts.sepetId: sepetId.toString(),
        AppTexts.userName: userName,
      });

      final response = await _dio.post(url, data: formData);

      debugPrint(
        "${AppTexts.deleteCartResponseStatusCode} ${response.statusCode}",
      );
      debugPrint("${AppTexts.deleteCartResponseData} ${response.data}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data is String
            ? jsonDecode(response.data)
            : response.data;
        if (responseData[AppTexts.success] != 1) {
          throw ProductException(
            '${AppTexts.deleteFromCartError} - ${responseData[AppTexts.message]}',
          );
        }
      } else {
        throw ProductException(AppTexts.deleteFromCartServerError);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint("${AppTexts.dioErrorResponse} ${e.response?.data}");
        debugPrint(
          "${AppTexts.dioErrorResponseStatusCode} ${e.response?.statusCode}",
        );
        throw ProductException(
          '${AppTexts.deleteFromCartServerError} -  ${AppTexts.dioError} ${e.response?.statusCode ?? 'Unknown'}',
        );
      } else {
        throw ProductException(
          '${AppTexts.deleteFromCartError} -  ${AppTexts.networkError} ${e.message}',
        );
      }
    } catch (e) {
      throw ProductException('${AppTexts.deleteFromCartError} $e');
    }
  }

  @override
  Future<void> clearCart({required String userName}) async {
    try {
      final cartResponse = await getCartProducts(userName: userName);
      for (var product in cartResponse.cartProducts) {
        await deleteProductFromCart(sepetId: product.id, userName: userName);
      }
    } catch (e) {
      throw ProductException('${AppTexts.clearCartError} $e');
    }
  }
}
