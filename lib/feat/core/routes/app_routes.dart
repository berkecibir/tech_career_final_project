import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';
import 'package:tc_bootcamp_final/feat/presentation/auth/page/auth_page.dart';
import 'package:tc_bootcamp_final/feat/presentation/cart/page/cart_page.dart';
import 'package:tc_bootcamp_final/feat/presentation/detail/page/detail_page.dart';
import 'package:tc_bootcamp_final/feat/presentation/home/page/home_page.dart';
import 'package:tc_bootcamp_final/feat/presentation/main/main_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    AuthPage.id: (context) => const AuthPage(),
    HomePage.id: (context) => const HomePage(),
    DetailPage.id: (context) {
      final product =
          ModalRoute.of(context)!.settings.arguments as ProductModel;
      return DetailPage(product: product);
    },
    CartPage.id: (context) {
      final product =
          ModalRoute.of(context)!.settings.arguments as ProductModel;
      return CartPage(product: product);
    },
    MainPage.id: (context) => MainPage(),
  };
}
