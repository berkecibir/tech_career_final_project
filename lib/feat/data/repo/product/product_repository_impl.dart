import 'package:tc_bootcamp_final/feat/core/exception/product_exception.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';
import 'package:tc_bootcamp_final/feat/data/repo/product/product_repository.dart';
import 'package:tc_bootcamp_final/feat/data/service/product/product_service.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService productService;

  ProductRepositoryImpl({required this.productService});
  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await productService.getAllProducts();
      if (response.success == 1) {
        return response.products;
      } else {
        throw ProductException(AppTexts.serverSuccessValueMessage);
      }
    } catch (e) {
      throw ProductException('${AppTexts.errorInRepository} $e');
    }
  }
}
