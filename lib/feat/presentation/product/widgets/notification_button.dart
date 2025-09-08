import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';
import 'package:tc_bootcamp_final/feat/core/sizes/app_sizes.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          Container(
            width: AppSizes.huge,
            height: AppSizes.huge,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color.fromRGBO(255, 255, 255, 0.2),
                width: 1,
              ),
            ),
            child: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
              size: AppSizes.large,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
