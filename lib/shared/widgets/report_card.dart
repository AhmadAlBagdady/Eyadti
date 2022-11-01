import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportCard extends StatelessWidget {
  final DateTime date;
  final String doctorName;
  final String status;
  final String time;

  const ReportCard(
      {Key? key,
      required this.date,
      required this.doctorName,
      required this.status,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: size.width * 20 / 375),
      child: SizedBox(
        height: size.height / 5.3,
        child: Row(
          children: [
            Container(
              width: size.width / 53.5,
              height: size.height / 5.3,
              color: status == 'Done' ? green : red,
            ),
            SizedBox(
              width: size.width * 100 / 375,
              height: size.height * 100 / 812,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${date.day}',
                      style: Fonts.semiBold(size: size.width / 11)),
                  Text(
                    DateFormat.E().format(date),
                    style: Fonts.semiBold(size: size.width / 17, color: grey),
                  )
                ],
              ),
            ),
            VerticalDivider(
              thickness: 2,
              indent: size.height / 28.4,
              endIndent: size.height / 28.4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 25 / 375),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: Fonts.semiBold(size: 14, color: grey),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: size.width / 101.5),
                    child: Text(DateFormat.yMd().format(date),
                        style: Fonts.semiBold(
                            size: 13, color: grey.withOpacity(0.5))),
                  ),
                  Text(
                    '${time.substring(0, 5)} ${pMOrAM(time.substring(0, 2))}',
                    style: Fonts.semiBold(size: 14, color: grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
