import 'package:departments/screens/patient/single%20clinic/single_clinic.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ClinicCard extends StatelessWidget {
  const ClinicCard(
      {Key? key,
      required this.sessionPriceSingleClinic,
      required this.doctorsCount,
      required this.idSingleClinic,
      required this.nameSingleClinic})
      : super(key: key);

  final int idSingleClinic;
  final String nameSingleClinic;
  final num sessionPriceSingleClinic;
  final int doctorsCount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SingleClinic(
                  id: idSingleClinic,
                  name: nameSingleClinic,
                  cost: sessionPriceSingleClinic,
                )))
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: size.width * 36 / 375,
            top: size.height * 24 / 812,
            bottom: size.height * 26 / 812),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: size.width * 53.5 / 375,
              backgroundColor: veryLightBlue.withOpacity(0.5),
              child: CircleAvatar(
                backgroundColor: lightBlue,
                radius: size.width * 42.5 / 375,
                child: Icon(
                  MyIcons.tooth1,
                  size: size.width * 37 / 375,
                  color: white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 13 / 375,
                  vertical: size.height * 11 / 812),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    enableTextWidth(12, nameSingleClinic),
                    style: Fonts.fBold(size: 14, color: darkBlue),
                  ),
                  SizedBox(
                    height: size.height * 3 / 812,
                  ),
                  Text('$sessionPriceSingleClinic',
                      style: Fonts.fRegular(size: 13, color: lightGrey)),
                  SizedBox(
                    height: size.height * 10 / 812,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: lightBlue,
                        radius: size.width * 13.5 / 375,
                        child: CircleAvatar(
                            radius: size.width * 12 / 375,
                            backgroundColor: white,
                            child: const Icon(
                              MyIcons.user,
                              size: 12,
                              color: lightBlue,
                            )),
                      ),
                      SizedBox(
                        width: size.width * 5 / 375,
                      ),
                      Text(
                        '$doctorsCount ${LocaleKeys.doctors.tr().toLowerCase()}',
                        style: Fonts.fBold(size: 13, color: grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 40 / 375,
                  vertical: size.height * 11 / 812),
              child: Text(
                LocaleKeys.open.tr().toUpperCase(),
                style: Fonts.fBold(size: 13, color: yellow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
