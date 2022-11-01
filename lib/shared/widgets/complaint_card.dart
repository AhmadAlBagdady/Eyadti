import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/complaint_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ComplaintCard extends StatelessWidget {
  const ComplaintCard(
      {Key? key,
      required this.title,
      required this.status,
      required this.time,
      required this.content})
      : super(key: key);

  final String title;
  final String content;
  final int status;
  final int time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => ComplaintDialog(
                  content: content,
                  status: status,
                  time: time,
                ));
      },
      child: Padding(
        padding: EdgeInsets.only(
            top: size.height * 20 / 812,
            bottom: size.height * 20 / 812,
            left: size.height * 17 / 375,
            right: size.width * 10 / 375),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                    height: size.height * 40 / 812,
                    width: size.width * 41 / 375,
                    color: status == 1
                        ? green
                        : status == 0
                            ? red
                            : yellow),
                SizedBox(
                  height: size.height * 3 / 812,
                ),
                Text(
                    status == 1 ? LocaleKeys.done.tr() : LocaleKeys.reject.tr(),
                    style: Fonts.semiBold(size: size.height * 14 / 812))
              ],
            ),
            SizedBox(
              width: size.width * 26.66 / 375,
            ),
            Container(
              width: 2,
              color: lightGrey,
              height: size.height * 96.83 / 812,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 23.34 / 375,
                  right: size.width * 23.34 / 375),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width / 2.5,
                    child: Wrap(
                      children: [
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Fonts.semiBold(
                              size: size.height * 14 / 812, color: grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 7 / 812,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: lightGrey,
                        size: size.height * 13.51 / 812,
                      ),
                      SizedBox(
                        width: size.width * 7.25 / 375,
                      ),
                      Text(
                        time <= 24
                            ? '$time hours ago'
                            : '${(time / 24).floor()} days ago',
                        style: Fonts.semiBold(
                            size: size.height * 14 / 812, color: lightGrey),
                      )
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    MyIcons.cross__1_,
                    size: size.width / 28.8,
                    color: grey,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
