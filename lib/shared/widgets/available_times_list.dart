import 'package:departments/screens/patient/add%20appointment/cubit/cubit.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:flutter/material.dart';

class AvailableTimeList extends StatelessWidget {
  AvailableTimeList(
      {Key? key, required this.availableTimesList, required this.cubit})
      : super(key: key);
  final List<dynamic> availableTimesList;
  final AddAppointCubit cubit;
String  ?value;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(availableTimesList.length, (index) {
          value = availableTimesList.first;
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  cubit.changeSelectAvailableTime(index,value!);
                },
                child: Container(
                  width: size.width / 3,
                  height: size.height * 48 / 812,
                  decoration: BoxDecoration(
                      color:
                          cubit.availableTimeSelect == index ? lightGrey : grey,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      '${availableTimesList[index]} ${pMOrAM(availableTimesList[index])}',
                      style: Fonts.fBold(
                          size: size.height * 20 / 812,
                          color: cubit.availableTimeSelect == index
                              ? grey
                              : white),
                    ),
                  ),
                ),
              ));
        }),
      ),
    );
  }
}
