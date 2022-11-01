import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/forget%20password/reset_password.dart';
import 'package:departments/models/forget%20password/send_code.dart';
import 'package:departments/models/forget%20password/send_email.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitialState extends ForgetPasswordState {}

class ForgetPasswordSendEmailSuccessState extends ForgetPasswordState {
  final SendEmail sendEmail;
  ForgetPasswordSendEmailSuccessState(this.sendEmail);
}

class ForgetPasswordSendEmailErrorState extends ForgetPasswordState {
  final ErrorModel errorModel;
  ForgetPasswordSendEmailErrorState(this.errorModel);
}

class ForgetPasswordSendEmailLoadingState extends ForgetPasswordState {}

class ForgetPasswordSendCodeSuccessState extends ForgetPasswordState {
  final SendCode sendCode;
  ForgetPasswordSendCodeSuccessState(this.sendCode);
}

class ForgetPasswordSendCodeErrorState extends ForgetPasswordState {
  final ErrorModel errorModel;
  ForgetPasswordSendCodeErrorState(this.errorModel);
}

class ForgetPasswordSendCodeLoadingState extends ForgetPasswordState {}

class ForgetPasswordResetPasswordSuccessState extends ForgetPasswordState {
  final ResetPassword resetPassword;
  ForgetPasswordResetPasswordSuccessState(this.resetPassword);
}

class ForgetPasswordResetPasswordErrorState extends ForgetPasswordState {
  final ErrorModel errorModel;
  ForgetPasswordResetPasswordErrorState(this.errorModel);
}

class ForgetPasswordResetPasswordLoadingState extends ForgetPasswordState {}
