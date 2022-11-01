import 'package:departments/layout/patient/patientCubit/cubit.dart';
import 'package:departments/layout/shared/cubit/cubit.dart';
import 'package:departments/screens/shared/notifications/notifications.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({Key? key, required this.title, this.onPressedSearch})
      : super(key: key);
  String title;
  Function()? onPressedSearch;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
        elevation: 0,
        title: Text(title),
        backgroundColor: lightBlue,
        leading: Padding(
          padding: EdgeInsets.only(left: size.width * 34 / 375),
          child: appBarButton(
              onPressed: () {
                MainCubit.get(context).layoutKey.currentState!.openDrawer();
              },
              size: size,
              icon: MyIcons.list),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: size.width * 34.34 / 375,
                left: size.width * 17.13 / 375),
            child: appBarButton(
                onPressed: onPressedSearch ?? () {},
                size: size,
                icon: MyIcons.search),
          ),
        ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
