import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/cubit/main/main_cubit.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';
import 'package:tc_bootcamp_final/feat/presentation/cart/page/cart_page.dart';
import 'package:tc_bootcamp_final/feat/presentation/home/page/home_page.dart';

class MainPage extends StatelessWidget {
  static const String id = AppTexts.mainPageId;

  MainPage({super.key});

  final List<Widget> _pages = [
    const HomePage(),
    const CartPage(
      product: ProductModel(
        id: 0,
        name: '',
        image: '',
        price: 0,
        brand: '',
        category: '',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainCubit(),
      child: BlocBuilder<MainCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: _pages[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) => context.read<MainCubit>().changePage(index),
              selectedItemColor: AppColors.deepPurple,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: AppTexts.homeAppBar,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: AppTexts.cartAppBar,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
