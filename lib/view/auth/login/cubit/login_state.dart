import 'package:task/models/login_model.dart';

abstract class LoginStates {}

class InitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class LoginIsPassword extends LoginStates {}
