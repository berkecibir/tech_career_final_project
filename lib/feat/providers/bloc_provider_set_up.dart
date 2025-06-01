import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tc_bootcamp_final/feat/cubit/auth/auth_cubit.dart';
import 'package:tc_bootcamp_final/feat/cubit/cart/cart_cubit.dart';
import 'package:tc_bootcamp_final/feat/cubit/home/home_cubit.dart';
import 'package:tc_bootcamp_final/feat/cubit/main/main_cubit.dart';
import 'package:tc_bootcamp_final/feat/data/repo/cart/cart_repository_impl.dart';
import 'package:tc_bootcamp_final/feat/data/repo/product/product_repository_impl.dart';
import 'package:tc_bootcamp_final/feat/data/service/auth/auth_service_impl.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tc_bootcamp_final/feat/data/service/cart/cart_service_impl.dart';
import 'package:tc_bootcamp_final/feat/data/service/product/product_service_impl.dart';

class BlocProvidersSetUp {
  static List<SingleChildWidget> providers = <SingleChildWidget>[
    BlocProvider<AuthCubit>(create: (_) => AuthCubit(MockAuthService())),
    BlocProvider<HomeCubit>(
      create: (_) => HomeCubit(
        ProductRepositoryImpl(productService: ProductServiceImpl()),
      ),
    ),
    BlocProvider<CartCubit>(
      create: (_) =>
          CartCubit(CartRepositoryImpl(cartService: CartServiceImpl())),
    ),
    BlocProvider<MainCubit>(create: (_) => MainCubit()),
  ];
}
