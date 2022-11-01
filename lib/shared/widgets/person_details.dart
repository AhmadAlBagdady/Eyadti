import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonDetails extends StatelessWidget {
  PersonDetails(
      {Key? key,
      required this.name,
      required this.phoneNum,
      required this.title,
      required this.roleName,
      this.clinicName})
      : super(key: key);
  final String name;
  final String title;
  final String roleName;
  final String phoneNum;
  String? clinicName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 21 / 812,
          right: size.width * 34 / 375,
          left: size.width * 34.37 / 375,
          bottom: size.height * 15 / 812),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Fonts.fBold(size: size.height * 13 / 812)),
              Text(name,
                  style: Fonts.fRegular(
                      size: size.height * 14 / 812, color: grey)),
              roleName == 'doctor'
                  ? Text(clinicName!,
                      style: Fonts.fRegular(
                          size: size.height * 14 / 812, color: grey))
                  : Container(),
              (roleName == 'patient' && role == 'Patient')
                  ? Container()
                  : (roleName == 'doctor' && role == 'Doctor')
                      ? Container()
                      : Row(
                          children: [
                            Icon(
                              MyIcons.call_outgoing__1_,
                              size: size.width * 10.47 / 375,
                              color: grey,
                            ),
                            SizedBox(
                              width: size.width * 5.53 / 375,
                            ),
                            MaterialButton(
                              elevation: 0,
                              color: white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(color: grey, width: 2)),
                              onPressed: () async {
                                final Uri launcherUri =
                                    Uri(scheme: 'tel', path: phoneNum);
                                await launchUrl(launcherUri);
                              },
                              child: Text(phoneNum,
                                  style: Fonts.fRegular(
                                      size: size.height * 14 / 812,
                                      color: grey)),
                            )
                          ],
                        ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: blue, width: 3),
                shape: BoxShape.circle),
            child: CircleAvatar(
              radius: size.width * 31 / 375,
              backgroundColor: white,
              child: roleName == 'doctor'
                  ? Container()
                  : Icon(
                      MyIcons.user,
                      size: size.height * 40 / 812,
                      color: blue,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
