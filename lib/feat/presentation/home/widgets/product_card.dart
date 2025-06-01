import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/border/app_border_radius.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';
import 'package:tc_bootcamp_final/feat/core/sizes/app_sizes.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_padding/device_padding.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_size/device_size.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_spacing/device_spacing.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/navigation/navigation_helper.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';
import 'package:tc_bootcamp_final/feat/presentation/detail/page/detail_page.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.circular(AppSizes.normal),
      ),
      elevation: AppSizes.xSmall,
      child: InkWell(
        onTap: () {
          Navigation.push(
            page: DetailPage(product: product),
            arguments: product,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: AppBorderRadius.only(topLeft: 16, topRight: 16),
              child: Image.network(
                'http://kasimadalan.pe.hu/urunler/resimler/${product.image}',
                height: DeviceSize.height! * 0.18,
                width: double.infinity,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: DevicePadding.tiny.all,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.normal,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  DeviceSpacing.xsmall.height,
                  Text(
                    product.brand,
                    style: const TextStyle(color: AppColors.grey),
                  ),
                  DeviceSpacing.small.height,
                  Text(
                    '${product.price} ${AppTexts.turkishLira}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
