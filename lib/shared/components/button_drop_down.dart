import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

Widget buttonDropDown(
  String title,
  bool isArrowClicked,
  Function() onTap,
) =>
    InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            color: dividerColor,
            height: size.height * 10 / 812,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 7 / 812,
                horizontal: size.width * 34 / 375),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Fonts.fBold(
                    size: size.height * 13 / 812,
                  ),
                ),
                Transform(
                    alignment: Alignment.center,
                    transform: isArrowClicked
                        ? Matrix4.rotationZ(math.pi * -1 / 2)
                        : Matrix4.rotationY(math.pi),
                    child: Icon(
                      MyIcons.angle_left,
                      size: size.height * 13 / 812,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
