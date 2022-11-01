import 'package:departments/screens/shared/posts/posts.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:flutter/material.dart';

class DepartmentCard extends StatelessWidget {
  const DepartmentCard({Key? key, required this.name, required this.id})
      : super(key: key);
  final String name;
  final int id;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: size.width * 125 / 375,
      height: size.height * 125 / 812,
      elevation: 0,
      color: lightBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Posts(
                  id: id,
                  departmentName: name,
                )));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            MyIcons.tooth1,
            color: white,
            size: size.width * 57.41 / 375,
          ),
          SizedBox(
            height: size.height * 2.6 / 812,
          ),
          Text(
            name,
            style: Fonts.fBold(size: size.height * 20 / 812, color: white),
          )
        ],
      ),
    );
  }
}
