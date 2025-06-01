import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';
import 'package:tc_bootcamp_final/feat/core/sizes/app_sizes.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_padding/device_padding.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_size/device_size.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_spacing/device_spacing.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';
import 'package:tc_bootcamp_final/feat/presentation/detail/widgets/add_to_cart_button.dart';

class DetailPage extends StatelessWidget {
  static const String id = AppTexts.detailPageId;

  final ProductModel product;

  const DetailPage({super.key, required this.product});

  final String productImage = 'http://kasimadalan.pe.hu/urunler/resimler/';

  String get productImageUrl => '$productImage${product.image}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Image.network(
            productImageUrl,
            height: DeviceSize.height! * 0.4,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: DevicePadding.medium.all,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                DeviceSpacing.small.height,
                Text(
                  product.brand,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.normal,
                  ),
                ),
                DeviceSpacing.large.height,
                Text(
                  '${product.price} ${AppTexts.turkishLira}',
                  style: const TextStyle(
                    fontSize: AppSizes.large,
                    fontWeight: FontWeight.bold,
                    color: AppColors.deepPurple,
                  ),
                ),
                DeviceSpacing.large.height,
              ],
            ),
          ),
          Center(child: AddToCartButton(product: product)),
        ],
      ),
    );
  }
}
