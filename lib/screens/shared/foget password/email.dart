import 'package:departments/models/forget%20password/send_email.dart';
import 'package:departments/screens/shared/foget%20password/code.dart';
import 'package:departments/screens/shared/foget%20password/cubit/cubit.dart';
import 'package:departments/screens/shared/foget%20password/cubit/state.dart';
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

class Email extends StatelessWidget {
  SendEmail? sendEmail;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
        if (state is ForgetPasswordSendEmailSuccessState) {
          sendEmail = state.sendEmail;

          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => Code()));
        } else if (state is ForgetPasswordSendEmailErrorState) {
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
                          LocaleKeys.email.tr(),
                          style: Fonts.fBold(size: 14, color: darkBlue),
                        ),
                        SizedBox(
                          height: size.height * 8 / 812,
                        ),
                        textFormField(
                            textInputType: TextInputType.emailAddress,
                            controller: forgetPasswordCubit.emailController,
                            labelText: LocaleKeys.email.tr(),
                            border: const OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.emailValidate.tr();
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
                                forgetPasswordCubit.sendEmail(
                                    email: forgetPasswordCubit
                                        .emailController.text);
                              }
                            },
                            child: state is ForgetPasswordSendEmailLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: white,
                                    ),
                                  )
                                : Text(
                                    LocaleKeys.sendCode.tr(),
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
                        Text(LocaleKeys.here.tr(),
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
