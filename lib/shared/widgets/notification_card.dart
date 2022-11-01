import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String doctorName;
  final int numOfDays;
  final Function()? onPressed;
  const NotificationCard(
      {Key? key,
      required this.title,
      required this.doctorName,
      required this.numOfDays,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 25 / 375, vertical: size.height * 30 / 812),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    Fonts.semiBold(size: size.height * 17 / 812, color: grey),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.width / 101.5),
                child: Text('${LocaleKeys.byDr.tr()} ${doctorName}',
                    style:
                        Fonts.semiBold(size: 13, color: grey.withOpacity(0.5))),
              ),
              SizedBox(
                height: size.height * 11.25 / 812,
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: grey,
                    size: size.width * 13.5 / 375,
                  ),
                  SizedBox(
                    width: size.width * 7.25 / 375,
                  ),
                  Text(
                    '${numOfDays} ${LocaleKeys.daysAgo.tr()}',
                    style: Fonts.semiBold(size: 14, color: grey),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: onPressed,
              icon: Icon(
                MyIcons.cross__1_,
                size: size.width / 28.8,
                color: grey,
              )),
        ],
      ),
    );
  }
}
