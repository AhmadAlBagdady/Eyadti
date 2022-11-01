import 'package:departments/shared/components/simple_info.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DoctorSimpleInfo extends StatelessWidget {
  DoctorSimpleInfo(
      {required this.exp,
      required this.phoneNum,
      required this.patientCount,
      required this.age,
      required this.appointCount,
      required this.gender,
      Key? key})
      : super(key: key);
  int exp;
  String phoneNum;
  int patientCount;
  int age;
  int appointCount;
  String gender;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            simpleInfo(
                icon: Icons.work_outline,
                title: '$exp ${LocaleKeys.years.tr().toLowerCase()}',
                content: 'Experience'),
            SizedBox(
              height: size.height * 20 / 812,
            ),
            simpleInfo(
                icon: MyIcons.call_outgoing, title: 'Phone', content: phoneNum),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            simpleInfo(
                icon: MyIcons.user,
                title: patientCount >= 1000
                    ? '${(patientCount / 1000).floor()} K+'
                    : '$patientCount',
                content: 'Patient'),
            SizedBox(
              height: size.height * 20 / 812,
            ),
            simpleInfo(
                icon: MyIcons.calendar,
                title: 'Age',
                content: '$age ${LocaleKeys.age.tr().toLowerCase()}'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            simpleInfo(
                icon: MyIcons.calendar,
                title: appointCount >= 1000
                    ? '${(appointCount / 1000).floor()} K+'
                    : '$appointCount',
                content: 'Appoint'),
            SizedBox(
              height: size.height * 20 / 812,
            ),
            simpleInfo(
                icon: gender == 'Male' ? Icons.male : Icons.female,
                title: 'Gender',
                content: gender),
          ],
        ),
      ],
    );
  }
}
