import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tc_bootcamp_final/feat/cubit/home/home_state.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';
import 'package:tc_bootcamp_final/feat/data/repo/product/product_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductRepository repository;

  List<ProductModel> _allProducts = [];

  HomeCubit(this.repository) : super(HomeInitial());

  Future<void> fetchProducts() async {
    emit(HomeLoading());

    try {
      final response = await repository.getAllProducts();
      _allProducts = response;
      emit(HomeLoaded(_allProducts));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> searchProducts(String query) async {
    if (_allProducts.isEmpty && state is! HomeLoaded) {
      return;
    }

    if (query.isEmpty) {
      emit(HomeLoaded(_allProducts));
    } else {
      final filteredProducts = _allProducts.where((product) {
        final lowerCaseQuery = query.toLowerCase();
        return product.name.toLowerCase().contains(lowerCaseQuery) ||
            product.brand.toLowerCase().contains(lowerCaseQuery) ||
            product.category.toLowerCase().contains(lowerCaseQuery);
      }).toList();
      emit(HomeLoaded(filteredProducts));
    }
  }
}
