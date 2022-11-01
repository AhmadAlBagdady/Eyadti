import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PendingPatientCard extends StatelessWidget {
  const PendingPatientCard({Key? key, required this.name, required this.age})
      : super(key: key);

  final String name;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: darkBlue, width: 3)),
                child: CircleAvatar(
                  radius: size.width * 40 / 375,
                  backgroundColor: white,
                ),
              ),
              SizedBox(
                width: size.width * 19 / 375,
              ),
              Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 10 / 812,
                      ),
                      Text(name,
                          style: Fonts.fBold(
                              size: size.width * 14 / 375, color: darkBlue)),
                      SizedBox(height: size.height * 2 / 812),
                      Text(
                        '${LocaleKeys.age.tr()} $age',
                        style: TextStyle(
                            color: lightGrey, fontSize: size.width * 13 / 375),
                      ),
                      SizedBox(
                        height: size.height * 10 / 812,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
