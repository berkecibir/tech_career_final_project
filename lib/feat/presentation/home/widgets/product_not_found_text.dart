import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';
import 'package:tc_bootcamp_final/feat/core/sizes/app_sizes.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';

class ProductNotFoundText extends StatelessWidget {
  const ProductNotFoundText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppTexts.productNotFound,
      style: TextStyle(fontSize: AppSizes.base, color: AppColors.grey),
    );
  }
}
