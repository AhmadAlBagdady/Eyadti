import 'package:departments/models/doctor/get_all_doctors.dart';
import 'package:departments/screens/shared/doctors/doctors.dart';
import 'package:departments/screens/shared/single%20doctor/single_doctor.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomDoctorsList extends StatelessWidget {
  CustomDoctorsList({
    Key? key,
    required this.doctorsList,
  }) : super(key: key);
  List<Doctor> doctorsList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width / 11, vertical: size.height / 68),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.doctors.tr(),
                style: Fonts.fBold(size: size.width / 28.8),
              ),
              textButton(
                text: LocaleKeys.seeAll.tr().toUpperCase(),
                color: yellow,
                fontStyle:
                    Fonts.semiBold(size: size.width / 28.8, color: yellow),
                function: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Doctors(
                            doctorsList: doctorsList,
                          )));
                },
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.height / 7,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: size.width / 11),
            separatorBuilder: (context, index) => SizedBox(
              width: size.width / 12.09,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: doctorsList.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                circleAvatarButton(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SingleDoctor(
                                id: doctorsList[index].id!,
                              )));
                    },
                    color: lightBlue,
                    icon: MyIcons.doctor_icon,
                    size: size),
                SizedBox(
                  height: size.width / 75,
                ),
                Text(
                  doctorsList[index].name!.length > 8
                      ? doctorsList[index].name!.substring(0, 8) + '...'
                      : doctorsList[index].name!,
                  style: Fonts.semiBold(size: 14, color: lightBlue),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
