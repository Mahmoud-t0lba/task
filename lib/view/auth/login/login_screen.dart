import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:task/components/app_widgets/app_back.dart';
import 'package:task/components/app_widgets/components.dart';
import 'package:task/components/app_widgets/custom_btn.dart';
import 'package:task/components/app_widgets/custom_tf.dart';
import 'package:task/components/app_widgets/glass_button.dart';
import 'package:task/components/consts/app_colors.dart';
import 'package:task/components/consts/app_images.dart';
import 'package:task/components/consts/const.dart';
import 'package:task/components/shared/cache_helper.dart';
import 'package:task/view/auth/login/cubit/login_cubit.dart';
import 'package:task/view/auth/login/cubit/login_state.dart';
import 'package:task/view/home/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.token != null) {
              CacheHelper.saveData(key: 'token', value: state.loginModel.token)
                  .then((value) {
                loginToken = state.loginModel.token;
                navigateAndFinish(context, const HomeScreen());
              });
            } else {
              customSnackBar(context, text: 'Login Failed');
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return AppBack(
            image: AppImages.loginBack,
            fit: BoxFit.cover,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: GlassButton(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 15),
                            const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 30),
                            CustomTF(
                              autocorrect: true,
                              controller: cubit.emailController,
                              type: TextInputType.emailAddress,
                              label: 'Email Address',
                              validate: 'please enter your email address',
                            ),
                            const SizedBox(height: 30),
                            CustomTF(
                              controller: cubit.passwordController,
                              type: TextInputType.visiblePassword,
                              label: 'Password',
                              onSubmit: (v) {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.userLogin();
                                }
                              },
                              isPassword: cubit.isPassword,
                              suffix: cubit.suffix,
                              suffixPressed: () {
                                cubit.changeIcon();
                              },
                              validate: 'please enter your password',
                            ),
                            const Spacer(),
                            Conditional.single(
                              context: context,
                              conditionBuilder: (context) =>
                                  state is! LoginLoadingState,
                              widgetBuilder: (context) {
                                return DefaultButton(
                                  onTap: () {
                                    if (cubit.formKey.currentState!
                                        .validate()) {
                                      cubit.userLogin();
                                    }
                                  },
                                  text: 'submit'.toUpperCase(),
                                  color: ColorManager.textColor,
                                  fontWeight: FontWeight.w700,
                                  size: 20,
                                );
                              },
                              fallbackBuilder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
