import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/models/department/get_all_departments.dart';
import 'package:departments/screens/patient/single%20clinic/single_clinic.dart';
import 'package:departments/screens/patient/single%20department/single_department.dart';
import 'package:departments/screens/shared/departments/cubit/cubit.dart';
import 'package:departments/screens/shared/departments/cubit/state.dart';
import 'package:departments/screens/shared/departments/departments.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomClinicsList extends StatelessWidget {
  CustomClinicsList({
    Key? key,
    required this.seeAllFunc,
    required this.name,
    required this.id,
    required this.clinicsList,
  }) : super(key: key);
  final Function()? seeAllFunc;
  final String name;
  final int id;

  final List<Clinic> clinicsList;

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
                name,
                style: Fonts.fBold(size: size.width / 28.8),
              ),
              textButton(
                text: 'SEE ALL',
                color: yellow,
                fontStyle:
                    Fonts.semiBold(size: size.width / 28.8, color: yellow),
                function: seeAllFunc!,
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
            itemCount: clinicsList.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                circleAvatarButton(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SingleClinic(
                                id: clinicsList[index].id!,
                                name: clinicsList[index].name!,
                                cost: clinicsList[index].sessionPrice!,
                              )));
                    },
                    color: lightBlue,
                    icon: MyIcons.clinic_icon,
                    size: size),
                SizedBox(
                  height: size.width / 75,
                ),
                Text(
                  clinicsList[index].name!.length > 8
                      ? clinicsList[index].name!.substring(0, 8) + '...'
                      : clinicsList[index].name!,
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
