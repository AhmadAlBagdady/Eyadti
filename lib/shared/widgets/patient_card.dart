import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  const PatientCard(
      {Key? key,
      required this.name,
      required this.age,
      required this.numOfAppointments})
      : super(key: key);

  final String name;
  final int age;
  final int numOfAppointments;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 5.3,
      child: Padding(
        padding: EdgeInsets.only(
            right: size.width * 34 / 375,
            left: size.width * 34 / 375,
            top: size.height * 30 / 812,
            bottom: size.height * 37 / 812),
        child: Row(
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
                      'age $age',
                      style: TextStyle(
                          color: lightGrey, fontSize: size.width * 13 / 375),
                    ),
                    SizedBox(
                      height: size.height * 10 / 812,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: lightBlue,
                          radius: size.width * 16 / 375,
                          child: CircleAvatar(
                              radius: size.width * 14 / 375,
                              backgroundColor: white,
                              child: Icon(
                                Icons.shopping_bag,
                                size: size.width * 17 / 375,
                                color: lightBlue,
                              )),
                        ),
                        SizedBox(
                          width: size.width * 5 / 375,
                        ),
                        Text(
                          '$numOfAppointments Appoints',
                          style: Fonts.fRegular(size: size.width * 13 / 375),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
