import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';
import 'package:tc_bootcamp_final/feat/core/sizes/app_sizes.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_padding/device_padding.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_spacing/device_spacing.dart';
import 'package:tc_bootcamp_final/feat/presentation/cart/widgets/complete_order_button.dart';

class CartSummary extends StatelessWidget {
  final double totalPrice;

  const CartSummary({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DevicePadding.medium.all,
      child: Column(
        children: [
          const Divider(),
          DeviceSpacing.small.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppTexts.totalPrice,
                style: TextStyle(
                  fontSize: AppSizes.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${totalPrice.toStringAsFixed(2)} ${AppTexts.turkishLira}',
                style: const TextStyle(
                  fontSize: AppSizes.large,
                  fontWeight: FontWeight.bold,
                  color: AppColors.deepPurple,
                ),
              ),
            ],
          ),
          DeviceSpacing.medium.height,
          const CompleteOrderButton(),
        ],
      ),
    );
  }
}
