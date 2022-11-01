import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ComplaintDialog extends StatelessWidget {
  const ComplaintDialog(
      {Key? key,
      required this.content,
      required this.status,
      required this.time})
      : super(key: key);
  final String content;
  final int status;
  final int time;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      titlePadding: EdgeInsets.all(0),
      title: AppBar(
        backgroundColor: lightBlue,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              MyIcons.angle_left,
              size: size.height * 18.2 / 812,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(LocaleKeys.complaints.tr(),
            style: Fonts.semiBold(size: 20, color: white)),
        titleSpacing: size.width * 21.43 / 375,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 25.57 / 375),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                MyIcons.cross__1_,
                size: size.height * 13 / 812,
              ),
            ),
          )
        ],
      ),
      content: SizedBox(
        height: size.height * 260 / 812,
        width: size.width * 287 / 375,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: size.height * 40 / 812,
                    width: size.width * 41 / 375,
                    color: status == 1
                        ? green
                        : status == 0
                            ? red
                            : yellow,
                  ),
                  SizedBox(
                    width: size.width * 17 / 375,
                  ),
                  Text(
                    status == 1 ? LocaleKeys.done.tr() : LocaleKeys.reject.tr(),
                    style: Fonts.semiBold(size: 14),
                  ),
                  SizedBox(
                    width: size.width * 52 / 375,
                  ),
                  Icon(
                    Icons.access_time,
                    color: lightGrey,
                    size: size.width * 13.51 / 375,
                  ),
                  SizedBox(
                    width: size.width * 5.25 / 375,
                  ),
                  Text(
                    time <= 24
                        ? '$time hours ago'
                        : '${(time / 24).floor()} days ago',
                    style: Fonts.semiBold(size: 14, color: lightGrey),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 21.92 / 812,
              ),
              Divider(
                color: grey,
              ),
              Wrap(
                children: [
                  Text(
                    content,
                    style: TextStyle(
                        fontSize: size.height * 14 / 812,
                        color: grey,
                        height: size.height * 1.809 / 812),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
