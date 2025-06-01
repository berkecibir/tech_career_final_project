import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/cubit/cart/cart_cubit.dart';
import 'package:tc_bootcamp_final/feat/presentation/cart/page/cart_page.dart';

mixin CartPageMixin on State<CartPage> {
  final String userName = AppTexts.defaultUserName;

  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCartProducts(userName: userName);
  }
}
