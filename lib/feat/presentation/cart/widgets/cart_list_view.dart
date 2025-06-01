import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';
import 'package:tc_bootcamp_final/feat/core/sizes/app_sizes.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_padding/device_padding.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_size/device_size.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_spacing/device_spacing.dart';
import 'package:tc_bootcamp_final/feat/cubit/cart/cart_cubit.dart';
import 'package:tc_bootcamp_final/feat/data/model/cart/cart_product_model.dart';

class CartListView extends StatelessWidget {
  final List<CartProductModel> cartProducts;
  final String userName;

  const CartListView({
    super.key,
    required this.cartProducts,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: DevicePadding.medium.all,
      itemCount: cartProducts.length,
      itemBuilder: (context, index) {
        final product = cartProducts[index];
        return Card(
          margin: DevicePadding.small.onlyVertical,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: AppSizes.xSmall,
          child: Padding(
            padding: DevicePadding.small.all,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'http://kasimadalan.pe.hu/urunler/resimler/${product.image}',
                    height: DeviceSize.height! * 0.1,
                    width: DeviceSize.height! * 0.1,
                    fit: BoxFit.cover,
                  ),
                ),
                DeviceSpacing.medium.width,
                Expanded(
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
                      Text(
                        product.brand,
                        style: const TextStyle(color: AppColors.grey),
                      ),
                      DeviceSpacing.medium.height,
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
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        if (product.quantity > 1) {
                          context.read<CartCubit>().updateCartItemQuantity(
                            cartProduct: product,
                            newQuantity: product.quantity - 1,
                            userName: userName,
                          );
                        } else {
                          context.read<CartCubit>().deleteProductFromCart(
                            sepetId: product.id,
                            userName: userName,
                          );
                        }
                      },
                    ),
                    Text(
                      product.quantity.toString(),
                      style: const TextStyle(fontSize: AppSizes.normal),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () {
                        context.read<CartCubit>().updateCartItemQuantity(
                          cartProduct: product,
                          newQuantity: product.quantity + 1,
                          userName: userName,
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: AppColors.red,
                      ),
                      onPressed: () {
                        context.read<CartCubit>().deleteProductFromCart(
                          sepetId: product.id,
                          userName: userName,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
