import 'package:departments/screens/shared/change%20password/cubit/cubit.dart';
import 'package:departments/screens/shared/change%20password/cubit/state.dart';
import 'package:departments/screens/shared/login/login_screen.dart';
import 'package:departments/shared/components/custom.dart';
import 'package:departments/shared/components/text.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/custom_clipper.dart';
import 'package:departments/shared/widgets/custom_painter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../settings/settings.dart';

class ChangePassword extends StatelessWidget {
  var currentPasswordController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) => {},
          builder: (context, state) {
            ChangePasswordCubit changePasswordCubit =
                ChangePasswordCubit.get(context);
            return Scaffold(
              body: SingleChildScrollView(
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
                      LocaleKeys.changePassword.tr(),
                      style: Fonts.fBold(size: 34, color: darkBlue),
                    ),
                    Text(
                      LocaleKeys.changeYourPassword.tr(),
                      style: Fonts.fBold(size: 14, color: lightGrey),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 31 / 812,
                          left: size.width * 37 / 375,
                          right: size.width * 37 / 375),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.currentPassword.tr(),
                            style: Fonts.fBold(size: 14, color: darkBlue),
                          ),
                          SizedBox(
                            height: size.height * 8 / 812,
                          ),
                          textFormField(
                            textInputType: TextInputType.emailAddress,
                            controller: currentPasswordController,
                            labelText: LocaleKeys.currentPassword.tr(),
                            border: const OutlineInputBorder(),
                            suffixIcon:
                                changePasswordCubit.isCurrentPasswordSecure
                                    ? Icon(MyIcons.eye)
                                    : Icon(MyIcons.eye_crossed),
                            onPressed: () {
                              changePasswordCubit
                                  .changeSecure('isCurrentPasswordSecure');
                            },
                            obscureText:
                                changePasswordCubit.isCurrentPasswordSecure
                                    ? true
                                    : false,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          SizedBox(
                            height: size.height * 13 / 812,
                          ),
                          Text(
                            LocaleKeys.newPassword.tr(),
                            style: Fonts.fBold(size: 14, color: darkBlue),
                          ),
                          SizedBox(
                            height: size.height * 8 / 812,
                          ),
                          textFormField(
                            textInputType: TextInputType.emailAddress,
                            controller: passwordController,
                            labelText: LocaleKeys.newPassword.tr(),
                            border: const OutlineInputBorder(),
                            suffixIcon: changePasswordCubit.isNewPasswordSecure
                                ? Icon(MyIcons.eye)
                                : Icon(MyIcons.eye_crossed),
                            onPressed: () {
                              changePasswordCubit
                                  .changeSecure('isNewPasswordSecure');
                            },
                            obscureText: changePasswordCubit.isNewPasswordSecure
                                ? true
                                : false,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          SizedBox(
                            height: size.height * 13 / 812,
                          ),
                          Text(
                            LocaleKeys.confirmPassword.tr(),
                            style: Fonts.fBold(size: 14, color: darkBlue),
                          ),
                          SizedBox(
                            height: size.height * 8 / 812,
                          ),
                          textFormField(
                            textInputType: TextInputType.emailAddress,
                            controller: confirmPasswordController,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: LocaleKeys.confirmPassword.tr(),
                            border: const OutlineInputBorder(),
                            suffixIcon:
                                changePasswordCubit.isConfirmPasswordSecure
                                    ? Icon(MyIcons.eye)
                                    : Icon(MyIcons.eye_crossed),
                            onPressed: () {
                              changePasswordCubit
                                  .changeSecure('isConfirmPasswordSecure');
                            },
                            obscureText:
                                changePasswordCubit.isConfirmPasswordSecure
                                    ? true
                                    : false,
                          ),
                          SizedBox(
                            height: size.height * 47 / 812,
                          ),
                          SizedBox(
                            width: size.width * 301 / 375,
                            child: MaterialButton(
                              elevation: 0,
                              height: size.height * 56 / 812,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              // child: text(text: 'Sign in', color: white),
                              child: Text(
            LocaleKeys.changePassword.tr(),
                                style: Fonts.fRegular(size: 20, color: white),
                              ),
                              color: lightGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 17 / 812,
                          horizontal: size.width * 130 / 375),
                      child: Row(
                        children: [
                          Text(
                          LocaleKeys.backTo.tr(),
                            style: Fonts.fRegular(size: 14, color: grey),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Settings()));
                              },
                              child: Text(
            LocaleKeys.settings.tr(),
                                style:
                                    Fonts.fRegular(size: 14, color: lightBlue),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
