import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tc_bootcamp_final/feat/cubit/home/home_cubit.dart';
import 'package:tc_bootcamp_final/feat/cubit/home/home_state.dart';
import 'package:tc_bootcamp_final/feat/presentation/home/mixin/home_mixin.dart';
import 'package:tc_bootcamp_final/feat/presentation/home/widgets/empty_home_page_text.dart';
import 'package:tc_bootcamp_final/feat/presentation/home/widgets/product_grid.dart';
import 'package:tc_bootcamp_final/feat/presentation/home/widgets/product_not_found_text.dart';
import 'package:tc_bootcamp_final/feat/presentation/home/widgets/searh_field.dart';
import 'package:tc_bootcamp_final/feat/presentation/product/widgets/custom_app_bar.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_padding/device_padding.dart';

class HomePage extends StatefulWidget {
  static const String id = AppTexts.homePageId;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar.home(),
        body: Column(
          children: [
            Padding(
              padding: DevicePadding.medium.all,
              child: SearhField(searchController: searchController),
            ),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state is HomeLoaded) {
                    if (state.products.isEmpty &&
                        searchController.text.isNotEmpty) {
                      return const Center(child: ProductNotFoundText());
                    } else if (state.products.isEmpty &&
                        searchController.text.isEmpty) {
                      return const Center(child: EmptyHomePageText());
                    }
                    return ProductGrid(products: state.products);
                  } else if (state is HomeError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
