import 'package:departments/screens/doctor/single%20nurse/single_nurse.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NurseCard extends StatelessWidget {
  const NurseCard(
      {Key? key,
      required this.name,
      required this.clinic,
      required this.years,
      required this.id})
      : super(key: key);
  final String name;
  final String clinic;
  final int years;
  final int id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('1111111111111');
        print(id);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SingleNurse(
                  id: id,
                )));
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 34 / 375,
              top: size.height * 30 / 812,
              bottom: size.height * 37 / 812,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: darkBlue, width: size.width * 3 / 375)),
                  child: CircleAvatar(
                    radius: size.width * 44 / 375,
                    backgroundColor: white,
                  ),
                ),
                SizedBox(
                  width: size.width * 20 / 375,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Fonts.fBold(
                          size: size.height * 14 / 812, color: darkBlue),
                    ),
                    SizedBox(height: size.height * 2 / 758),
                    Text(
                      clinic,
                      style: Fonts.fBold(
                          size: size.height * 13 / 812, color: lightGrey),
                    ),
                    SizedBox(
                      height: size.height * 10 / 758,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: lightBlue,
                          radius: size.width * 16 / 375,
                          child: CircleAvatar(
                              radius: size.width * 14 / 375,
                              backgroundColor: white,
                              child: const Icon(
                                Icons.shopping_bag,
                                size: 17,
                                color: lightBlue,
                              )),
                        ),
                        SizedBox(
                          width: size.width * 5 / 375,
                        ),
                        Text(
                          '$years ${LocaleKeys.years.tr().toLowerCase()}',
                          style: Fonts.fBold(
                              size: size.height * 13 / 812, color: grey),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            color: dividerColor,
            height: size.height * 10 / 812,
          ),
        ],
      ),
    );
  }
}
