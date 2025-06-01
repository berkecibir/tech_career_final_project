import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/core/utils/validator/form_validator.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_padding/device_padding.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_spacing/device_spacing.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/navigation/navigation_helper.dart';
import 'package:tc_bootcamp_final/feat/cubit/auth/auth_cubit.dart';
import 'package:tc_bootcamp_final/feat/cubit/auth/auth_state.dart';
import 'package:tc_bootcamp_final/feat/data/service/auth/auth_service_impl.dart';
import 'package:tc_bootcamp_final/feat/presentation/auth/widgets/auth_greet_text.dart';
import 'package:tc_bootcamp_final/feat/presentation/auth/widgets/login_button.dart';
import 'package:tc_bootcamp_final/feat/presentation/main/main_page.dart';
import 'package:tc_bootcamp_final/feat/presentation/product/widgets/custom_app_bar.dart';
import '../widgets/login_text_field.dart';

class AuthPage extends StatelessWidget {
  static const String id = AppTexts.authPageId;
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(MockAuthService()),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar.auth(),
          body: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }

              if (state is AuthSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(AppTexts.authCompletedMessage)),
                );
                Navigation.pushReplace(page: MainPage());
              }
            },
            builder: (context, state) {
              final cubit = context.read<AuthCubit>();
              return Center(
                child: Padding(
                  padding: DevicePadding.medium.all,
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AuthGreetText(),
                        DeviceSpacing.xlarge.height,
                        LoginTextField.email(
                          controller: cubit.emailController,
                          validator: FormValidator.validateEmail,
                        ),
                        DeviceSpacing.medium.height,
                        LoginTextField.password(
                          controller: cubit.passwordController,
                          validator: FormValidator.validatePassword,
                        ),
                        DeviceSpacing.xlarge.height,
                        state is AuthLoading
                            ? (state).loadingWidget
                            : LoginButton(cubit: cubit),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
