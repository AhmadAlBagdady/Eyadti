import 'package:departments/models/settings/change_language.dart';
import 'package:departments/screens/shared/change%20password/change_password.dart';
import 'package:departments/screens/shared/settings/cubit/cubit.dart';
import 'package:departments/screens/shared/settings/cubit/state.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/drop_down_list.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/components/text.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/local/cach_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);
  List<String> lightMode = ['Light', 'Dark'];

  var passwordController = TextEditingController(text: 'ahmad');
  var userNameController = TextEditingController(text: 'Ahmad');

  ChangeLanguage? changeLanguage;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is SettingsChangeLanguageSuccessState) {
            changeLanguage = state.changeLanguage;
            showToast(msg: changeLanguage!.message!, color: green);
          } else if (state is SettingsChangeLanguageErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          SettingsCubit settingsCubit = SettingsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: Padding(
                padding: EdgeInsets.only(left: size.width / 14),
                child: appBarButton(
                    onPressed: () {
                      Navigator.of(context).pop(context);
                    },
                    size: size,
                    icon: MyIcons.angle_left),
              ),
              title: Text(
                LocaleKeys.settings.tr(),
                style:
                    Fonts.fRegular(size: size.height * 20 / 812, color: white),
              ),
              backgroundColor: lightBlue,
              actions: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.width * 20.5 / 375),
                  child: IconButton(
                      onPressed: () async {
                        settingsCubit.changeLanguage(
                            newLanguage: settingsCubit.selectedLanguage!);
                        await context
                            .setLocale(Locale(settingsCubit.selectedLanguage!));
                      },
                      icon: Icon(Icons.check)),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 30 / 812,
                    horizontal: size.width * 34 / 375),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.layoutsMode.tr(),
                      style: Fonts.fBold(size: size.height * 13 / 812),
                    ),
                    SizedBox(
                      height: size.height * 14 / 812,
                    ),
                    dropDownList(
                        validate: (value) {},
                        hintText: LocaleKeys.theme.tr(),
                        items: lightMode,
                        selectedValue: settingsCubit.selectedMode,
                        onChanged: (value) {
                          settingsCubit.changeSelectedItem('mode', value);
                        }),
                    SizedBox(
                      height: size.height * 28 / 812,
                    ),
                    Text(
                      LocaleKeys.language.tr(),
                      style: Fonts.fBold(size: size.height * 13 / 812),
                    ),
                    SizedBox(
                      height: size.height * 14 / 812,
                    ),
                    dropDownList(
                        validate: (value) {},
                        hintText: LocaleKeys.language.tr(),
                        items: settingsCubit.language,
                        selectedValue: settingsCubit.selectedLanguage,
                        onChanged: (value) {
                          settingsCubit.selectedLanguage = value;
                          settingsCubit.changeSelectedItem('language', value);
                        }),
                    SizedBox(
                      height: size.height * 28 / 812,
                    ),
                    Text(
                      LocaleKeys.username.tr(),
                      style: Fonts.fBold(size: size.height * 13 / 812),
                    ),
                    SizedBox(
                      height: size.height * 14 / 812,
                    ),
                    textFormField(
                      controller: userNameController,
                      border: OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    SizedBox(
                      height: size.height * 28 / 812,
                    ),
                    Text(
                      LocaleKeys.password.tr(),
                      style: Fonts.fBold(size: size.height * 13 / 812),
                    ),
                    SizedBox(
                      height: size.height * 14 / 812,
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        textFormField(
                          enabled: false,
                          controller: passwordController,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChangePassword()));
                          },
                          child: Text(
                            LocaleKeys.change.tr(),
                            style: Fonts.fRegular(
                                size: size.height * 13 / 812, color: lightGrey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
