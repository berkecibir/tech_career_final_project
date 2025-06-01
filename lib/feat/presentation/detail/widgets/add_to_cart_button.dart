import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tc_bootcamp_final/feat/core/border/app_border_radius.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';
import 'package:tc_bootcamp_final/feat/core/durations/app_duration.dart';
import 'package:tc_bootcamp_final/feat/core/sizes/app_sizes.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_size/device_size.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/navigation/navigation_helper.dart';
import 'package:tc_bootcamp_final/feat/cubit/cart/cart_cubit.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';
import 'package:tc_bootcamp_final/feat/presentation/cart/page/cart_page.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CartCubit>().addProductToCart(
          product: product,
          quantity: 1,
          userName: AppTexts.defaultUserName,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${product.name} ${AppTexts.addToCartSuccess}'),
            duration: AppDuration.twoSecond,
          ),
        );
        Navigation.push(
          page: CartPage(product: product),
          arguments: product,
        );
      },
      child: Container(
        width: DeviceSize.width! * 0.5,
        height: DeviceSize.height! * 0.06,
        decoration: BoxDecoration(
          color: AppColors.deepPurple,
          borderRadius: AppBorderRadius.all(AppSizes.small),
        ),
        child: const Center(
          child: Text(
            AppTexts.addToCart,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontSize: AppSizes.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
