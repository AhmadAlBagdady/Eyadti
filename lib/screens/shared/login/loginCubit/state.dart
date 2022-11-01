import 'package:departments/models/auth/login_model.dart';
import 'package:departments/models/error%20model/error_model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}
class LoginLoadingState extends LoginState{}
class LoginErrorState extends LoginState {
  final ErrorModel errorModel;

  LoginErrorState(this.errorModel);
}
