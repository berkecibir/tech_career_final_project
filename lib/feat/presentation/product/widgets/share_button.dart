import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/border/app_border_radius.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';
import 'package:tc_bootcamp_final/feat/core/sizes/app_sizes.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_padding/device_padding.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: DevicePadding.small.onlyRight,
      child: Container(
        width: AppSizes.huge,
        height: AppSizes.huge,
        decoration: BoxDecoration(
          color: AppColors.offWhite,
          borderRadius: AppBorderRadius.circular(AppSizes.tiny),
          border: Border.all(color: AppColors.offWhite, width: 1),
        ),
        child: const Icon(
          Icons.share_outlined,
          color: AppColors.slate,
          size: AppSizes.large,
        ),
      ),
    );
  }
}
