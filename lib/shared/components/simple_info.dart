import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget simpleInfo(
        {required IconData icon,
        required String title,
        required var content}) =>
    Row(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  Border.all(color: lightBlue, width: size.width * 1.5 / 375)),
          child: CircleAvatar(
              radius: size.width * 14 / 375,
              backgroundColor: veryLight,
              child: Icon(
                icon,
                size: 17,
                color: lightBlue,
              )),
        ),
        SizedBox(
          width: size.width * 5 / 375,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Fonts.fBold(size: size.height * 13 / 812, color: grey),
            ),
            Text(
              '$content',
              style: Fonts.fRegular(size: size.height * 13 / 812, color: grey),
            )
          ],
        ),
      ],
    );
