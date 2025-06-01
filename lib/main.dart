import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_theme.dart';
import 'package:tc_bootcamp_final/feat/core/init/app_init.dart';
import 'package:tc_bootcamp_final/feat/core/routes/app_routes.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/navigation/navigation_helper.dart';
import 'package:tc_bootcamp_final/feat/presentation/auth/page/auth_page.dart';
import 'package:tc_bootcamp_final/feat/providers/bloc_provider_set_up.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  // auth sayfası için
  // mail => berkeatahan@mail.com
  // şifre => 123456

  @override
  Widget build(BuildContext context) {
    AppInit.initDeviceSize(context);
    return MultiBlocProvider(
      providers: BlocProvidersSetUp.providers,
      child: MaterialApp(
        theme: AppTheme.appTheme,
        initialRoute: AuthPage.id,
        routes: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
        navigatorKey: Navigation.navigationKey,
      ),
    );
  }
}
