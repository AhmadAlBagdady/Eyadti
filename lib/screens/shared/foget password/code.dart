import 'package:departments/models/forget%20password/send_code.dart';
import 'package:departments/screens/shared/foget%20password/cubit/cubit.dart';
import 'package:departments/screens/shared/foget%20password/cubit/state.dart';
import 'package:departments/screens/shared/foget%20password/password.dart';
import 'package:departments/screens/shared/login/login_screen.dart';
import 'package:departments/shared/components/custom.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/components/text.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/custom_clipper.dart';
import 'package:departments/shared/widgets/custom_painter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Code extends StatelessWidget {
  SendCode? sendCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
        if (state is ForgetPasswordSendCodeSuccessState) {
          sendCode = state.sendCode;
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Password()));
        } else if (state is ForgetPasswordSendCodeErrorState) {
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
                    LocaleKeys.typeCode.tr(),
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
                          LocaleKeys.code.tr(),
                          style: Fonts.fBold(size: 14, color: darkBlue),
                        ),
                        SizedBox(
                          height: size.height * 8 / 812,
                        ),
                        textFormField(
                            textInputType: TextInputType.emailAddress,
                            controller: forgetPasswordCubit.codeController,
                            labelText: LocaleKeys.code.tr(),
                            border: const OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.codeValidate.tr();
                              }
                            }),
                        SizedBox(
                          height: size.height * 25 / 812,
                        ),
                        SizedBox(
                          width: size.width * 301 / 375,
                          child: MaterialButton(
                            elevation: 0,
                            height: size.height * 56 / 812,
                            onPressed: () {
                              if (forgetPasswordCubit.formKey.currentState!
                                  .validate()) {
                                forgetPasswordCubit.sendCode(
                                    email: forgetPasswordCubit
                                        .emailController.text,
                                    code: forgetPasswordCubit
                                        .codeController.text);
                              }
                            },
                            child: state is ForgetPasswordSendCodeLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: white,
                                    ),
                                  )
                                : Text(
                                    LocaleKeys.next.tr(),
                                    style:
                                        Fonts.fRegular(size: 20, color: white),
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
                        horizontal: size.width * 90 / 375),
                    child: Row(
                      children: [
                        Text(
                          LocaleKeys.rememberIt.tr(),
                          style: Fonts.fRegular(size: 14, color: grey),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              LocaleKeys.signIn.tr(),
                              style: Fonts.fRegular(size: 14, color: lightBlue),
                            )),
                        Text(LocaleKeys.here.tr().toLowerCase(),
                            style: Fonts.fRegular(size: 14, color: grey))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
