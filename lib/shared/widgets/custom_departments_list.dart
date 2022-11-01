import 'package:departments/models/department/get_all_departments.dart';
import 'package:departments/screens/patient/single%20department/single_department.dart';
import 'package:departments/screens/shared/departments/departments.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomDepartmentsList extends StatelessWidget {
  CustomDepartmentsList({
    Key? key,
    this.n,
    required this.namesList,
    required this.seeAllFunc,
  }) : super(key: key);
  List<Department> namesList;
  final Function()? seeAllFunc;
  String? n = LocaleKeys.departments.tr();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width / 11, vertical: size.height / 68),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                n == null ? LocaleKeys.departments.tr() : n!,
                style: Fonts.fBold(size: size.width / 28.8),
              ),
              textButton(
                text: LocaleKeys.seeAll.tr().toUpperCase(),
                color: yellow,
                fontStyle:
                    Fonts.semiBold(size: size.width / 28.8, color: yellow),
                function: seeAllFunc!,
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.height / 7,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: size.width / 11),
            separatorBuilder: (context, index) => SizedBox(
              width: size.width / 12.09,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: namesList.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                circleAvatarButton(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SingleDepartment(
                                id: namesList[index].id!,
                                departmentName: namesList[index].name!,
                              )));
                    },
                    color: lightBlue,
                    icon: MyIcons.department_icon,
                    size: size),
                SizedBox(
                  height: size.width / 75,
                ),
                Text(
                  namesList[index].name!.length > 8
                      ? namesList[index].name!.substring(0, 8) + '...'
                      : namesList[index].name!,
                  style: Fonts.semiBold(size: 14, color: lightBlue),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
