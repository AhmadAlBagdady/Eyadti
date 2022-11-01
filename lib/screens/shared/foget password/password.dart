import 'package:departments/models/forget%20password/reset_password.dart';
import 'package:departments/screens/shared/foget%20password/cubit/cubit.dart';
import 'package:departments/screens/shared/foget%20password/cubit/state.dart';
import 'package:departments/screens/shared/login/login_screen.dart';
import 'package:departments/shared/components/custom.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/components/text.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/custom_clipper.dart';
import 'package:departments/shared/widgets/custom_painter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Password extends StatelessWidget {
  ResetPassword? resetPassword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
        if (state is ForgetPasswordResetPasswordSuccessState) {
          resetPassword = state.resetPassword;
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
        } else if (state is ForgetPasswordResetPasswordErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
      }, builder: (context, state) {
        ForgetPasswordCubit forgetPasswordCubit =
            ForgetPasswordCubit.get(context);

        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: forgetPasswordCubit.formKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      clipPath(
                        clipper: MyClipper(),
                        child: Container(
                          height: size.height * 195 / 812,
                          color: lightBlue,
                        ),
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height * 55 / 812,
                            ),
                            customPaint(
                                height: size.height * 184.95 / 812,
                                width: size.width * 300 / 375,
                                painter: ChangePasswordPainter())
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    LocaleKeys.resetPassword.tr().toUpperCase(),
                    style: Fonts.fBold(size: 34, color: darkBlue),
                  ),
                  Text(
                    LocaleKeys.typeNewPasswordAndConfirm.tr(),
                    style: Fonts.fBold(size: 14, color: lightGrey),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 78 / 812,
                        left: size.width * 37 / 375,
                        right: size.width * 37 / 375),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.newPassword.tr(),
                          style: Fonts.fBold(size: 14, color: darkBlue),
                        ),
                        SizedBox(
                          height: size.height * 8 / 812,
                        ),
                        textFormField(
                          validate: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.passwordValidate.tr();
                            }
                          },
                          textInputType: TextInputType.emailAddress,
                          controller: forgetPasswordCubit.passwordController,
                          labelText: LocaleKeys.newPassword.tr(),
                          border: const OutlineInputBorder(),
                          suffixIcon: forgetPasswordCubit.isNewPasswordSecure
                              ? Icon(MyIcons.eye)
                              : Icon(MyIcons.eye_crossed),
                          onPressed: () {
                            forgetPasswordCubit
                                .changeSecure('isNewPasswordSecure');
                          },
                          obscureText: forgetPasswordCubit.isNewPasswordSecure
                              ? true
                              : false,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        SizedBox(
                          height: size.height * 41 / 812,
                        ),
                        Text(
                          LocaleKeys.confirmPassword.tr(),
                          style: Fonts.fBold(size: 14, color: darkBlue),
                        ),
                        SizedBox(
                          height: size.height * 8 / 812,
                        ),
                        textFormField(
                          validate: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.contentValidate.tr();
                            }
                          },
                          textInputType: TextInputType.emailAddress,
                          controller:
                              forgetPasswordCubit.confirmPasswordController,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: LocaleKeys.confirmPassword.tr(),
                          border: const OutlineInputBorder(),
                          suffixIcon:
                              forgetPasswordCubit.isConfirmPasswordSecure
                                  ? Icon(MyIcons.eye)
                                  : Icon(MyIcons.eye_crossed),
                          onPressed: () {
                            forgetPasswordCubit
                                .changeSecure('isConfirmPasswordSecure');
                          },
                          obscureText:
                              forgetPasswordCubit.isConfirmPasswordSecure
                                  ? true
                                  : false,
                        ),
                        SizedBox(
                          height: size.height * 51 / 812,
                        ),
                        SizedBox(
                          width: size.width * 301 / 375,
                          child: MaterialButton(
                            elevation: 0,
                            height: size.height * 56 / 812,
                            onPressed: () {
                              if (forgetPasswordCubit.formKey.currentState!
                                  .validate()) {
                                forgetPasswordCubit.resetPassword(
                                    email: forgetPasswordCubit
                                        .emailController.text,
                                    code:
                                        forgetPasswordCubit.codeController.text,
                                    password: forgetPasswordCubit
                                        .passwordController.text,
                                    confirmPassword: forgetPasswordCubit
                                        .confirmPasswordController.text);
                              }
                            },
                            child: state
                                    is ForgetPasswordResetPasswordLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Text(
                                    LocaleKeys.signIn.tr(),
                                    style:
                                        Fonts.fRegular(size: 20, color: white),
                                  ),
                            color: lightGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
