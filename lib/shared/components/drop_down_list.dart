import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

Widget dropDownList(
        {String? selectedValue,
        String? hintText,
        required String? Function(String?)? validate,
        required Function(String?)? onChanged,
        required List<String> items}) =>
    DropdownButtonFormField<String>(

      icon: Padding(
        padding: EdgeInsets.only(right: size.width * 10 / 375),
        child: Transform.rotate(
          angle: -math.pi / 2,
          child: Icon(
            MyIcons.angle_left,
            color: grey,
            size: size.width * 15 / 375,
          ),
        ),
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: size.width * 15 / 375),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 2, color: lightBlue),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 1, color: red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 2, color: red),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 1, color: grey),
        ),
      ),
      hint: Text(hintText!,
          style: Fonts.semiBold(size: size.height * 13 / 812, color: grey)),
      onChanged: onChanged,
      validator: validate,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
