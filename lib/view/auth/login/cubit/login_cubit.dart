import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/components/shared/dio_helper.dart';
import 'package:task/components/shared/end_points.dart';
import 'package:task/models/login_model.dart';
import 'package:task/view/auth/login/cubit/login_state.dart';

import '../../../../components/shared/cache_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginModel? loginModel;

  void userLogin() {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: AppEndPoints.login,
      data: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    ).then((value) {
      // print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      CacheHelper.saveData(key: 'name', value: loginModel!.user!.name!);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      // print('Error:${error.toString()}');
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changeIcon() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginIsPassword());
  }
}
