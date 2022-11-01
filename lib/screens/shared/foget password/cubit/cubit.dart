import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/forget%20password/reset_password.dart';
import 'package:departments/models/forget%20password/send_code.dart';
import 'package:departments/models/forget%20password/send_email.dart';
import 'package:departments/screens/shared/foget%20password/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitialState());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var codeController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  bool isNewPasswordSecure = true;
  bool isConfirmPasswordSecure = true;
  var formKey = GlobalKey<FormState>();

  void changeSecure(String isSecure) {
    if (isSecure == 'isNewPasswordSecure')
      isNewPasswordSecure = !isNewPasswordSecure;
    if (isSecure == 'isConfirmPasswordSecure')
      isConfirmPasswordSecure = !isConfirmPasswordSecure;
    emit(ForgetPasswordInitialState());
  }

  void sendEmail({required dynamic email}) {
    {
      emit(ForgetPasswordSendEmailLoadingState());
      DioHelper dioHelper = DioHelper();
      dioHelper
          .postData(url: sendEmailUrl, data: {'email': email}, token: token)
          .then((response) {
        if (response.statusCode! < 300) {
          late SendEmail sendEmail;
          sendEmail = SendEmail.fromJson(response.data);
          emit(ForgetPasswordSendEmailSuccessState(sendEmail));
        } else if (response.statusCode! < 500 && response.statusCode! > 300) {
          late ErrorModel errorModel;
          errorModel = ErrorModel.fromJson(response.data);
          emit(ForgetPasswordSendEmailErrorState(errorModel));
        } else if (response.statusCode! >= 500) {
          showToast(msg: LocaleKeys.errorServer.tr(), color: red);
        }
      });
    }
  }

  void sendCode({required dynamic email, required String code}) {
    {
      emit(ForgetPasswordSendCodeLoadingState());
      DioHelper dioHelper = DioHelper();
      dioHelper
          .postData(
              url: sendEmailUrl,
              data: {'token': code, 'email': email},
              token: token)
          .then((response) {
        if (response.statusCode! < 300) {
          late SendCode sendCode;
          sendCode = SendCode.fromJson(response.data);
          emit(ForgetPasswordSendCodeSuccessState(sendCode));
        } else if (response.statusCode! < 500 && response.statusCode! > 300) {
          late ErrorModel errorModel;
          errorModel = ErrorModel.fromJson(response.data);
          emit(ForgetPasswordSendCodeErrorState(errorModel));
        } else if (response.statusCode! >= 500) {
          showToast(msg: LocaleKeys.errorServer.tr(), color: red);
        }
      });
    }
  }

  void resetPassword({
    required dynamic email,
    required String code,
    required String password,
    required String confirmPassword,
  }) {
    {
      emit(ForgetPasswordResetPasswordLoadingState());
      DioHelper dioHelper = DioHelper();
      dioHelper
          .postData(
              url: sendEmailUrl,
              data: {
                'token': code,
                'email': email,
                'password': password,
                'password_confirmation': confirmPassword
              },
              token: token)
          .then((response) {
        if (response.statusCode! < 300) {
          late ResetPassword resetPassword;
          resetPassword = ResetPassword.fromJson(response.data);
          emit(ForgetPasswordResetPasswordSuccessState(resetPassword));
        } else if (response.statusCode! < 500 && response.statusCode! > 300) {
          late ErrorModel errorModel;
          errorModel = ErrorModel.fromJson(response.data);
          emit(ForgetPasswordResetPasswordErrorState(errorModel));
        } else if (response.statusCode! >= 500) {
          showToast(msg: LocaleKeys.errorServer.tr(), color: red);
        }
      });
    }
  }
}
