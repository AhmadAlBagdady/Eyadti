import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:flutter/material.dart';

class WorkHours extends StatelessWidget {
  WorkHours({Key? key, required this.mapOfWorkingTimes}) : super(key: key);

  List<String> mapOfWorkingTimes;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: size.width * 47 / 375,
        ),
        Icon(
          Icons.watch_later_outlined,
          color: grey,
        ),
        SizedBox(
          width: size.width * 8.12 / 375,
        ),
        Text(
          '${mapOfWorkingTimes[0]} PM',
          style: TextStyle(fontSize: 13, color: grey),
        ),
        SizedBox(
          width: size.width * 19 / 375,
        ),
        Text(
          'to',
          style: TextStyle(fontSize: 13, color: grey),
        ),
        SizedBox(
          width: size.width * 19 / 375,
        ),
        Icon(
          Icons.watch_later_outlined,
          color: grey,
        ),
        SizedBox(
          width: size.width * 8.12 / 375,
        ),
        Text(
          '${mapOfWorkingTimes[1]} PM ',
          style: TextStyle(fontSize: 13, color: grey),
        ),
      ],
    );
  }
}
