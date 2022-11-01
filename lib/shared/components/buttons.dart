import 'package:departments/screens/shared/notifications/cubit/cubit.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:flutter/material.dart';

Widget appBarButton(
        {required Function() onPressed,
        required Size size,
        required IconData icon,
        Color color = white}) =>
    InkWell(
        onTap: onPressed,
        child: Icon(
          icon,
          size: size.width * 16.31 / 375,
          color: color,
        ));

Widget appBarNotificationButton({
  required Function() onPressed,
  required Size size,
}) =>
    IconButton(
      onPressed: onPressed,
      icon: NotificationsCubit.isThereNotification
          ? Icon(
              MyIcons.bell,
              size: size.height * 17.12 / 812,
              color: yellow,
            )
          : Icon(
              MyIcons.bell,
              size: size.height * 17.12 / 812,
            ),
    );

Widget materialButton({
  double? height,
  Function()? onPressed,
  Widget? child,
  Color? color,
  double? minWidth,
}) =>
    MaterialButton(
      height: height,
      onPressed: onPressed,
      child: child,
      color: color,
      minWidth: minWidth,
    );

Widget textButton(
        {required String text,
        required Color color,
        TextStyle? fontStyle,
        required Function() function}) =>
    TextButton(
      onPressed: function,
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(color.withOpacity(0.2))),
      child: Text(
        text,
        style: fontStyle,
      ),
    );

Widget circleAvatarButton(
        {required Function() onTap,
        required IconData icon,
        required Size size,
        Color? color}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: veryLightBlue.withOpacity(0.5),
                width: size.width * 8 / 375)),
        child: CircleAvatar(
          radius: (size.width) / 13.5,
          child: Center(
              child: Icon(
            icon,
            color: white,
            size: size.width / 16.3,
          )),
          backgroundColor: color,
        ),
      ),
    );

Widget mainButton(
        {required Function() onPressed, required BuildContext context}) =>
    Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          border: Border.all(color: Colors.white, width: 5),
        ),
        child: FloatingActionButton(
          backgroundColor: lightBlue,
          onPressed: onPressed,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          elevation: 0,
        ),
      ),
    );
