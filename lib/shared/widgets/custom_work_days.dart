import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:flutter/material.dart';

class WorkDays extends StatelessWidget {
   WorkDays({required this.days,Key? key}) : super(key: key);
List<String> days;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 43,
          width: 43,
          decoration: BoxDecoration(
            color:days.contains('sa')?lightBlue: veryLight,
            border: Border.all(color: Colors.lightBlue),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(17),
                topLeft: Radius.circular(17)),
          ),
          child: Center(
              child: Text(
                'Sa',
                style: Fonts.fBold(size: size.height* 14 / 812 ,color:days.contains('sa')?white:lightBlue),
              )),
        ),
        VerticalDivider(
          width: size.width * 2 / 375,
        ),
        Container(
          height: 43,
          width: 43,
          decoration: BoxDecoration(
            color:days.contains('su')?lightBlue: veryLight,
            border: Border.all(color: Colors.lightBlue),
          ),
          child: Center(
              child: Text(
                'Su',
                style: Fonts.fBold(size: size.height* 14 / 812 ,color:days.contains('su')?white:lightBlue),
              )),
        ),
        VerticalDivider(
          width: size.width * 2 / 375,
        ),
        Container(
          height: 43,
          width: 43,
          decoration: BoxDecoration(
            color:days.contains('m')?lightBlue: veryLight,
            border: Border.all(color: Colors.lightBlue),
          ),
          child: Center(
              child: Text(
                'M',
                style: Fonts.fBold(size: size.height* 14 / 812 ,color:days.contains('m')?white:lightBlue),
              )),
        ),
        VerticalDivider(
          width: size.width * 2 / 375,
        ),
        Container(
          height: 43,
          width: 43,
          decoration: BoxDecoration(
            color:days.contains('t')?lightBlue: veryLight,
            border: Border.all(color: Colors.lightBlue),
          ),
          child: Center(
              child: Text(
                'T',
                style: Fonts.fBold(size: size.height* 14 / 812 ,color:days.contains('t')?white:lightBlue),
              )),
        ),
        VerticalDivider(
          width: size.width * 2 / 375,
        ),
        Container(
          height: 43,
          width: 43,
          decoration: BoxDecoration(
            color:days.contains('w')?lightBlue: veryLight,
            border: Border.all(color: Colors.lightBlue),
          ),
          child: Center(
              child: Text(
                'W',
                style: Fonts.fBold(size: size.height* 14 / 812 ,color:days.contains('w')?white:lightBlue),
              )),
        ),
        VerticalDivider(
          width: size.width * 2 / 375,
        ),
        Container(
          height: 43,
          width: 43,
          decoration: BoxDecoration(
            color:days.contains('th')?lightBlue: veryLight,
            border: Border.all(color: Colors.lightBlue),
          ),
          child: Center(
              child: Text(
                'Th',
                style: Fonts.fBold(size: size.height* 14 / 812 ,color:days.contains('th')?white:lightBlue),
              )),
        ),
        VerticalDivider(
          width: size.width * 2 / 375,
        ),
        Container(
          height: 43,
          width: 43,
          decoration: BoxDecoration(
            color:days.contains('f')?lightBlue: veryLight,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(17),
                topRight: Radius.circular(17)

            ),border: Border.all(color: Colors.lightBlue)
          ),
          child: Center(
              child: Text(
                'F',
                style: Fonts.fBold(size: size.height* 14 / 812 ,color:days.contains('f')?white:lightBlue),
              )),
        ),
      ],
    );
  }
}
