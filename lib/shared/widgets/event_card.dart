import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/widgets/complaint_dialog.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard(
      {required this.title, Key? key, required this.status, required this.date, required this.time  })
      : super(key: key);
  final String title;
  final String status;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
                height: size.height * 20 / 812,
                width: size.height * 20 / 812,
                color: status == 'Done'
                    ? green
                    : status == 'Canceled'
                    ? red
                    : yellow),
            SizedBox(
              height: size.height * 3 / 812,
            ),
            Text(status, style: Fonts.fBold(size: size.height * 11 / 812 , color: white))
          ],
        ),
        SizedBox(
          width: size.width * 10 / 375,
        ),
        Container(
          width: 2,
          color: white,
          height: size.height * 40 / 812,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: size.width * 10 / 375,
              right: size.width * 10 / 375),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Fonts.semiBold(
                        size: size.height * 14 / 812, color: white),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 7 / 812,
              ),
              Text(
                date,
                style: Fonts.semiBold(
                    size: size.height * 14 / 812, color: white.withOpacity(0.7)),
              ),
              SizedBox(
                height: size.height * 7 / 812,
              ),
              Text(
                '${time.substring(0, 5)} ${pMOrAM(time.substring(0, 2))}',
                style: Fonts.semiBold(
                    size: size.height * 14 / 812, color: white.withOpacity(0.7)),
              )
            ],
          ),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
              color: status == 'Done'
                  ? green
                  : status == 'Canceled'
                  ? red
                  : yellow,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          width: 10,
          height: size.height * 50 / 812,
        ),
      ],
    );
  }
}
