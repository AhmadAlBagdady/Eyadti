import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {Key? key,
      required this.msg,
      required this.stateNo,
      required this.stateYes})
      : super(key: key);

  final String msg;
  final Function() stateNo;
  final Function() stateYes;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        msg,
        style: Fonts.semiBold(size: 16, color: grey),
      ),
      actions: [
        textButton(
            text: 'NO',
            color: blue,
            fontStyle: Fonts.semiBold(size: 13, color: blue),
            function: stateNo),
        textButton(
            text: 'Yes',
            color: red,
            fontStyle: Fonts.semiBold(size: 13, color: red),
            function: stateYes),
      ],
    );
  }
}
