import 'package:departments/layout/doctor/doctor_layout.dart';
import 'package:departments/layout/patient/patient_layout.dart';
import 'package:departments/layout/reception/scan_qr_code.dart';
import 'package:departments/models/auth/login_model.dart';
import 'package:departments/screens/shared/login/loginCubit/cubit.dart';
import 'package:departments/screens/shared/login/loginCubit/state.dart';
import 'package:departments/shared/components/custom.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/components/role%20screen/role_screen.dart';
import 'package:departments/shared/components/text.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/local/cach_helper.dart';
import 'package:departments/shared/widgets/custom_clipper.dart';
import 'package:departments/shared/widgets/custom_painter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../foget password/email.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late LoginModel loginModel;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is LoginSuccessState) {
          CacheHelper.saveData(
              key: 'username', value: state.loginModel.data!.userName);
          CacheHelper.saveData(key: 'name', value: state.loginModel.data!.name);
          CacheHelper.saveData(
                  key: 'token', value: state.loginModel.data!.accessToken)
              .then((value) {
            token = state.loginModel.data!.accessToken!;
            showToast(msg: state.loginModel.message!, color: green)
                .then((value) {
              takeRole(state.loginModel.data!.roles!, context).then((value) {
                value == 'multiRoles'
                    ? Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => RoleScreen()))
                    : value == 'Patient'
                        ? Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => PatientLayout()))
                        : value == 'Doctor'
                            ? Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => DoctorLayout()))
                            : value == 'Reception'
                                ? Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ScanQrCode()))
                                : Container();
              });
            });
          });

          context.setLocale(Locale('${loginModel.data!.lang}'));
        } else if (state is LoginErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
      }, builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        return Scaffold(
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                                width: size.width * 170.85 / 375,
                                painter: LoginPainter())
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 11.4 / 812,
                  ),
                  Text(
                    LocaleKeys.welcomeBack.tr(),
                    style: Fonts.fBold(
                        size: size.width * 34 / 375, color: darkBlue),
                  ),
                  SizedBox(
                    height: size.height * 2 / 812,
                  ),
                  Text(
                    LocaleKeys.logInAccount.tr(),
                    style: Fonts.fRegular(
                        size: size.width * 14 / 375, color: grey),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 37 / 375,
                        vertical: size.height * 37 / 812),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.username.tr(),
                          style: Fonts.fRegular(
                            size: size.width * 14 / 375,
                            color: darkBlue,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 8 / 812,
                        ),
                        textFormField(
                            textInputType: TextInputType.emailAddress,
                            controller: emailController,
                            labelText: LocaleKeys.username.tr(),
                            border: const OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.emailValidate.tr();
                              }
                            }),
                        SizedBox(
                          height: size.height * 46 / 812,
                        ),
                        Text(
                          LocaleKeys.password.tr(),
                          style: Fonts.fRegular(
                              size: size.width * 14 / 375, color: darkBlue),
                        ),
                        SizedBox(
                          height: size.height * 8 / 812,
                        ),
                        textFormField(
                          labelText: LocaleKeys.password.tr(),
                          controller: passwordController,
                          border: const OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          suffixIcon: loginCubit.isPasswordSecure
                              ? Icon(
                                  MyIcons.eye,
                                  color: lightBlue,
                                )
                              : Icon(
                                  MyIcons.eye_crossed,
                                  color: lightBlue,
                                ),
                          onPressed: () {
                            loginCubit.changeSecure();
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.passwordValidate.tr();
                            }
                          },
                          obscureText:
                              loginCubit.isPasswordSecure ? true : false,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Email()));
                              },
                              child: Text(
                                LocaleKeys.forgotPassword.tr(),
                                style: Fonts.fRegular(
                                    size: size.width * 13 / 375, color: blue),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 31 / 812,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              elevation: 0,
                              height: size.height * 56 / 812,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  loginCubit.loginUser(
                                      emailController: emailController.text,
                                      passwordController:
                                          passwordController.text);
                                }
                              },
                              child: state is LoginLoadingState
                                  ? const CircularProgressIndicator(
                                      color: white,
                                    )
                                  : Text(
                                      LocaleKeys.signIn.tr(),
                                      style: Fonts.fRegular(
                                          size: size.height * 20 / 812,
                                          color: white),
                                    ),
                              color: lightBlue,
                            ))
                          ],
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
