import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/widgets/custom_certificate_card.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DoctorInfo extends StatelessWidget {
  const DoctorInfo(
      {Key? key,
      required this.yearsExp,
      required this.slotTime,
      required this.salary,
      required this.rate,
      required this.clinicName})
      : super(key: key);
  final int yearsExp;
  final String slotTime;
  final String salary;
  final String rate;
  final String clinicName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 34 / 375,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'years Experience',
                        style: Fonts.fBold(
                            size: size.height * 13 / 812, color: veryLightGrey),
                      ),
                      SizedBox(
                        height: size.height * 10 / 812,
                      ),
                      Container(
                        width: size.width / 2.5,
                        height: size.height * 48 / 812,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: lightGrey.withOpacity(0.3)),
                        child: Center(
                            child: Text(
                          '$yearsExp',
                          style: Fonts.fBold(
                              size: size.height * 14 / 812, color: grey),
                        )),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Slot Time',
                        style: Fonts.fBold(
                            size: size.height * 13 / 812, color: veryLightGrey),
                      ),
                      SizedBox(
                        height: size.height * 10 / 812,
                      ),
                      Container(
                        width: size.width / 2.5,
                        height: size.height * 48 / 812,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: lightGrey.withOpacity(0.3)),
                        child: Center(
                            child: Text(
                          slotTime,
                          style: Fonts.fBold(
                              size: size.height * 14 / 812, color: grey),
                        )),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: size.height * 14 / 812,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Salary',
                        style: Fonts.fBold(
                            size: size.height * 13 / 812, color: veryLightGrey),
                      ),
                      SizedBox(
                        height: size.height * 10 / 812,
                      ),
                      Container(
                        width: size.width / 2.5,
                        height: size.height * 48 / 812,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: lightGrey.withOpacity(0.3)),
                        child: Center(
                            child: Text(
                          '${salary} \$',
                          style: Fonts.fBold(
                              size: size.height * 14 / 812, color: grey),
                        )),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Salary rate',
                        style: Fonts.fBold(
                            size: size.height * 13 / 812, color: veryLightGrey),
                      ),
                      SizedBox(
                        height: size.height * 10 / 812,
                      ),
                      Container(
                        width: size.width / 2.5,
                        height: size.height * 48 / 812,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: lightGrey.withOpacity(0.3)),
                        child: Center(
                            child: Text(
                          '$rate %',
                          style: Fonts.fBold(
                              size: size.height * 14 / 812, color: grey),
                        )),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: size.height * 14 / 812,
              ),
              SizedBox(
                height: size.height * 14 / 812,
              ),
              Text(
                'Clinic',
                style: Fonts.fBold(size: 13, color: veryLightGrey),
              ),
              SizedBox(
                height: size.height * 14 / 812,
              ),
              Container(
                width: size.width,
                height: size.height * 48 / 812,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: lightGrey.withOpacity(0.3)),
                child: Center(
                  child: Text(
                    clinicName,
                    style:
                        Fonts.fBold(size: size.height * 14 / 812, color: grey),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 14 / 812,
        ),
        SizedBox(
          height: size.height * 31 / 812,
        ),
      ],
    );
  }
}
