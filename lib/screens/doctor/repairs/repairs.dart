import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/repair_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Repairs extends StatelessWidget {
  const Repairs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            LocaleKeys.reject.tr(),
            style: Fonts.semiBold(size: size.height * 20 / 812, color: white),
          ),
          backgroundColor: lightBlue,
          leading: Padding(
            padding: EdgeInsets.only(left: size.width / 14),
            child: appBarButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                size: size,
                icon: MyIcons.angle_left),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * 28 / 375, left: size.width * 15.79 / 375),
              child: appBarButton(
                  onPressed: () {}, size: size, icon: MyIcons.search),
            ),
          ]),
      body: ListView.separated(
          separatorBuilder: (context, index) => Container(
                color: veryLightBlue.withOpacity(0.2),
                height: size.height / 81.2,
              ),
          itemBuilder: (context, index) => const RepairCard(
                title: 'ad;jfad;ofijaodifjaoidfjoiadfjpoaidfhjhg',
                status: 1,
                time: 25,
              ),
          itemCount: 10),
    );
  }
}
