import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/border/app_border_radius.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';
import 'package:tc_bootcamp_final/feat/core/sizes/app_sizes.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_padding/device_padding.dart';

class SearhField extends StatelessWidget {
  const SearhField({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: AppTexts.searchWidgetTitle,
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: AppBorderRadius.circular(AppSizes.tiny),
          borderSide: BorderSide(
            color: AppColors.deepPurple.withValues(),
            width: AppSizes.tiny,
          ),
        ),
        filled: true,
        fillColor: AppColors.white,
        contentPadding: DevicePadding.small.all,
      ),
    );
  }
}
