import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/cubit/cart/cart_cubit.dart';
import 'package:tc_bootcamp_final/feat/cubit/cart/cart_state.dart';
import 'package:tc_bootcamp_final/feat/data/model/product/product_model.dart';
import 'package:tc_bootcamp_final/feat/presentation/cart/mixin/cart_page_mixin.dart';
import 'package:tc_bootcamp_final/feat/presentation/product/widgets/custom_app_bar.dart';
import 'package:tc_bootcamp_final/feat/presentation/cart/widgets/cart_list_view.dart';
import 'package:tc_bootcamp_final/feat/presentation/cart/widgets/cart_summary.dart';

class CartPage extends StatefulWidget {
  static const String id = AppTexts.cartPageId;
  final ProductModel product;
  const CartPage({super.key, required this.product});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with CartPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: CustomAppBar.cart(),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartActionSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text(AppTexts.cartUpdated)));
          } else if (state is CartError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${AppTexts.error} ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is CartLoaded) {
            if (state.cartProducts.isEmpty) {
              return Center(
                child: Text(
                  AppTexts.cartEmpty,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: CartListView(
                    cartProducts: state.cartProducts,
                    userName: userName,
                  ),
                ),
                CartSummary(totalPrice: state.totalPrice),
              ],
            );
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
