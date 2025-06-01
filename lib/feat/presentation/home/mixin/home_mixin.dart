import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tc_bootcamp_final/feat/cubit/home/home_cubit.dart';
import 'package:tc_bootcamp_final/feat/presentation/home/page/home_page.dart';

mixin HomeMixin on State<HomePage> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchProducts();
    searchController = TextEditingController();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    context.read<HomeCubit>().searchProducts(searchController.text);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }
}
