import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:flutter/material.dart';

Widget drawerListTile({
  required double sizeIcon,
  required IconData iconData,
  required String title,
  required Function() onTap,
}) =>
    Padding(
      padding: EdgeInsets.only(
          left: size.width / 20,
          top: role == 'Patient' ? size.height / 120 : size.height / 165,
          right: size.width / 20),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          color: lightBlue,
          size: size.width / 15,
        ),
        title: Text(
          title,
          style: Fonts.semiBold(
            size: size.width / 23,
            color: darkGrey.withOpacity(1),
          ),
        ),
      ),
    );
