import 'package:departments/screens/patient/add%20appointment/add_appointment.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard(
      {Key? key, required this.name, required this.clinic, required this.years})
      : super(key: key);
  final String name;
  final String clinic;
  final dynamic years;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 34 / 375,
        top: size.height * 30 / 812,
        bottom: size.height * 37 / 812,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(color: darkBlue, width: size.width * 3 / 375)),
            child: CircleAvatar(
              radius: size.width * 41.5 / 375,
              backgroundColor: white,
            ),
          ),
          SizedBox(
            width: size.width * 20 / 375,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    enableTextWidth(14, name),
                    style: Fonts.fBold(
                        size: size.height * 14 / 812, color: darkBlue),
                  ),
                  SizedBox(
                    width: size.width * 30 / 375,
                  ),
                  role == 'Patient'
                      ? textButton(
                          text: '+APPOINT',
                          fontStyle: Fonts.semiBold(
                              size: size.width * 13 / 375, color: yellow),
                          color: yellow,
                          function: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddAppointment()));
                          })
                      : Container()
                ],
              ),
              SizedBox(height: size.height * 2 / 812),
              Text(
                clinic,
                style:
                    Fonts.fBold(size: size.height * 13 / 812, color: lightGrey),
              ),
              SizedBox(
                height: size.height * 10 / 758,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: lightBlue, width: size.width * 1.5 / 375)),
                    child: CircleAvatar(
                        radius: size.width * 14 / 375,
                        backgroundColor: veryLight,
                        child: Icon(
                          Icons.shopping_bag,
                          size: 17,
                          color: lightBlue,
                        )),
                  ),
                  SizedBox(
                    width: size.width * 5 / 375,
                  ),
                  Text(
                    years == null ? '0' : '$years years',
                    style:
                        Fonts.fBold(size: size.height * 13 / 812, color: grey),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
