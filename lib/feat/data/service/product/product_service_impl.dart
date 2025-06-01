import 'dart:convert'; // jsonDecode artık gerekli olmayabilir, ancak hata ayıklama için bırakılabilir
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/exception/product_exception.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_response.dart';
import 'package:tc_bootcamp_final/feat/data/service/product/product_service.dart';

class ProductServiceImpl implements ProductService {
  @override
  Future<ProductResponse> getAllProducts() async {
    const url = "http://kasimadalan.pe.hu/urunler/tumUrunleriGetir.php";

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic>) {
          return ProductResponse.fromJson(
            response.data as Map<String, dynamic>,
          );
        } else if (response.data is String) {
          final decodedData = jsonDecode(response.data.toString());
          if (decodedData is Map<String, dynamic>) {
            return ProductResponse.fromJson(decodedData);
          } else {
            throw ProductException(
              '${AppTexts.productFetchError} ${AppTexts.unexpectedData}',
            );
          }
        } else {
          throw ProductException(
            '${AppTexts.productFetchError} ${AppTexts.unexpectedResponseType} ${response.data.runtimeType}',
          );
        }
      } else {
        throw ProductException(AppTexts.productServerError);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint("${AppTexts.dioErrorResponse} ${e.response?.data}");
        debugPrint(
          "${AppTexts.dioErrorResponseStatusCode} ${e.response?.statusCode}",
        );
        throw ProductException(
          '${AppTexts.productServerError} -${AppTexts.dioError} ${e.response?.statusCode ?? AppTexts.unknown}',
        );
      } else {
        throw ProductException(
          '${AppTexts.productFetchError} - ${AppTexts.networkError} ${e.message}',
        );
      }
    } catch (e) {
      throw ProductException('${AppTexts.productFetchError} $e');
    }
  }
}
