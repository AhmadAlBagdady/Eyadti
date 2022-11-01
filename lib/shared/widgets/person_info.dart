import 'package:departments/models/profile/get_general_profile.dart';
import 'package:departments/screens/shared/profile/cubit/cubit.dart';
import 'package:departments/shared/components/drop_down_list.dart';
import 'package:departments/shared/components/text.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PersonInfo extends StatelessWidget {
  PersonInfo(
      {Key? key,
      required this.first,
      required this.father,
      required this.last,
      required this.birth,
      required this.contactNumbers,
      required this.email,
      required this.cubit,
      required this.gender,
      required this.isItEdit})
      : super(key: key);
  final String first;
  final String father;
  final String last;
  final int gender;
  final String birth;
  List<String> contactNumbers;
  final String email;
  final ProfileCubit cubit;
  final bool isItEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 31 / 812,
        bottom: size.height * 27 / 812,
        left: size.width * 34 / 375,
        right: size.width * 34 / 375,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: lightBlue, width: size.height * 3 / 812)),
              child: CircleAvatar(
                child: Icon(
                  MyIcons.user,
                  size: size.height * 80 / 812,
                  color: lightBlue,
                ),
                radius: size.width * 54 / 375,
                backgroundColor: white,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 17 / 812,
          ),
          Text(
            LocaleKeys.firstName.tr(),
            style: Fonts.fBold(size: size.height * 13 / 812),
          ),
          SizedBox(
            height: size.height * 14 / 812,
          ),
          Container(
            height: size.height * 48 / 812,
            decoration: BoxDecoration(
              color: lightGrey.withOpacity(.3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                first,
                style: Fonts.fBold(size: size.height * 14 / 812, color: grey),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 17 / 812,
          ),
          Text(
            LocaleKeys.fatherName.tr(),
            style: Fonts.fBold(size: size.height * 13 / 812),
          ),
          SizedBox(
            height: size.height * 14 / 812,
          ),
          Container(
            height: size.height * 48 / 812,
            decoration: BoxDecoration(
              color: lightGrey.withOpacity(.3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                father,
                style: Fonts.fBold(size: size.height * 14 / 812, color: grey),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 17 / 812,
          ),
          Text(
            LocaleKeys.lastName.tr(),
            style: Fonts.fBold(size: size.height * 13 / 812),
          ),
          SizedBox(
            height: size.height * 14 / 812,
          ),
          Container(
            height: size.height * 48 / 812,
            decoration: BoxDecoration(
              color: lightGrey.withOpacity(.3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                last,
                style: Fonts.fBold(size: size.height * 14 / 812, color: grey),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 17 / 812,
          ),
          Text(
            LocaleKeys.birthDate.tr(),
            style: Fonts.fBold(size: size.height * 13 / 812),
          ),
          SizedBox(
            height: size.height * 14 / 812,
          ),
          Container(
            height: size.height * 48 / 812,
            decoration: BoxDecoration(
              color: lightGrey.withOpacity(.3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                birth,
                style: Fonts.fBold(size: size.height * 14 / 812, color: grey),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 17 / 812,
          ),
          Text(
            LocaleKeys.gender.tr(),
            style: Fonts.fBold(size: size.height * 13 / 812),
          ),
          SizedBox(
            height: size.height * 14 / 812,
          ),
          Container(
            width: size.width / 2.5,
            height: size.height * 48 / 812,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: lightGrey.withOpacity(0.3)),
            child: Center(
                child: Text(
              gender == 1
                  ? LocaleKeys.male.tr()
                  : gender == 0
                      ? LocaleKeys.female.tr()
                      : LocaleKeys.unknown.tr(),
              style: Fonts.fBold(size: size.height * 14 / 812, color: grey),
            )),
          ),
          SizedBox(
            height: size.height * 17 / 812,
          ),
          Text(
            LocaleKeys.contactNumbers.tr(),
            style: Fonts.fBold(size: size.height * 13 / 812),
          ),
          SizedBox(
            height: size.height * 14 / 812,
          ),
          contactNumbers.isEmpty && !isItEdit
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: size.height * 5 / 812),
                  child: Container(
                    height: size.height * 48 / 812,
                    decoration: BoxDecoration(
                      color: lightGrey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        LocaleKeys.notExist.tr(),
                        style: Fonts.fBold(
                            size: size.height * 14 / 812, color: grey),
                      ),
                    ),
                  ),
                )
              : contactNumbers.isNotEmpty && !isItEdit
                  ? Column(
                      children: List.generate(contactNumbers.length, (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 5 / 812),
                          child: Container(
                            height: size.height * 48 / 812,
                            decoration: BoxDecoration(
                              color: lightGrey.withOpacity(.3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                contactNumbers[index],
                                style: Fonts.fBold(
                                    size: size.height * 14 / 812, color: grey),
                              ),
                            ),
                          ),
                        );
                      }),
                    )
                  : contactNumbers.isEmpty && isItEdit
                      ? textFormField(
                          controller: TextEditingController(text: LocaleKeys.notExist.tr()),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          onChanged: (String input) {
                            ProfileCubit.contactNumbers[0] = input;
                          })
                      : Column(
                          children:
                              List.generate(contactNumbers.length, (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 5 / 812),
                            child: Container(
                              height: size.height * 48 / 812,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: textFormField(
                                      textInputType: TextInputType.number,
                                      controller:
                                          cubit.numbersControllers[index],
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      onChanged: (String input) {
                                        ProfileCubit.contactNumbers[index] =
                                            input;
                                      })),
                            ),
                          );
                        })),
          SizedBox(
            height: size.height * 17 / 812,
          ),
          Text(
            LocaleKeys.emailAddress.tr(),
            style: Fonts.fBold(size: size.height * 13 / 812),
          ),
          SizedBox(
            height: size.height * 14 / 812,
          ),
          email.isEmpty && !isItEdit
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: size.height * 5 / 812),
                  child: Container(
                    height: size.height * 48 / 812,
                    decoration: BoxDecoration(
                      color: lightGrey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        LocaleKeys.notExist.tr(),
                        style: Fonts.fBold(
                            size: size.height * 14 / 812, color: grey),
                      ),
                    ),
                  ),
                )
              : email.isNotEmpty && !isItEdit
                  ? Container(
                      height: size.height * 48 / 812,
                      decoration: BoxDecoration(
                        color: lightGrey.withOpacity(.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          email,
                          style: Fonts.fBold(
                              size: size.height * 14 / 812, color: grey),
                        ),
                      ),
                    )
                  : email.isEmpty && isItEdit
                      ? textFormField(
                          controller: TextEditingController(text: LocaleKeys.notExist.tr()),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          onChanged: (String input) {
                            ProfileCubit.emailAddress = input;
                          })
                      : textFormField(
                          textInputType: TextInputType.emailAddress,
                          controller: cubit.emailAddressController,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          onChanged: (String input) {
                            ProfileCubit.emailAddress = input;
                          }),
          SizedBox(
            height: size.height * 30 / 812,
          ),
          Divider(
            height: 2,
            color: grey,
          ),
        ],
      ),
    );
  }
}
