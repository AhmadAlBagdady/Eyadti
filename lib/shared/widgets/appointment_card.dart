import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentCard extends StatelessWidget {
  final String status;
  final String name;
  final DateTime date;
  final String time;
  final int id;
  final Function()? onPressed;
  final bool canCancel;
  const AppointmentCard({
    Key? key,
    required this.id,
    required this.status,
    required this.name,
    required this.date,
    required this.time,
    required this.onPressed,
    required this.canCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: size.width * 20 / 375),
      child: SizedBox(
        height: size.height / 5.3,
        child: Row(
          children: [
            Container(
              width: size.width / 35.5,
              height: size.height / 5.3,
              color: status == 'Pending' ? yellow : red,
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
                    style: Fonts.semiBold(
                        size: size.height * 17 / 812, color: grey),
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
                    enableTextWidth(20, name),
                    style: Fonts.semiBold(
                        size: 18 * size.height / 812, color: grey),
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
            const Spacer(),
            role == 'Doctor'
                ? Container()
                : IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      canCancel ? Icons.delete : MyIcons.cross__1_,
                      size: canCancel
                          ? size.height * 20 / 812
                          : size.height * 15 / 812,
                      color: grey,
                    )),
          ],
        ),
      ),
    );
  }
}
