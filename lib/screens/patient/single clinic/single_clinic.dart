import 'package:departments/models/clinic/get_single_clinic.dart';
import 'package:departments/screens/patient/add%20appointment/add_appointment.dart';
import 'package:departments/screens/patient/single%20clinic/cubit/cubit.dart';
import 'package:departments/screens/patient/single%20clinic/cubit/state.dart';
import 'package:departments/screens/shared/notifications/notifications.dart';
import 'package:departments/screens/shared/single%20doctor/single_doctor.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/doctor_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleClinic extends StatelessWidget {
  SingleClinic(
      {Key? key, required this.id, required this.name, required this.cost})
      : super(key: key);
  final int id;
  final String name;
  final num cost;
  GetSingleClinic? getSingleClinic;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleClinicCubit()..getSingleClinic(id),
      child: BlocConsumer<SingleClinicCubit, SingleClinicState>(
        listener: (context, state) {
          if (state is SingleClinicSuccessState) {
            getSingleClinic = state.getSingleClinic;
          } else if (state is SingleClinicErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: white,
            appBar: AppBar(
                elevation: 0,
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
                title: Padding(
                  padding: EdgeInsets.only(right: size.width * 52.13 / 375),
                  child: Text(
                    name,
                    style: Fonts.semiBold(
                        size: size.height * 20 / 812, color: white),
                  ),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: size.width * 34.34 / 375,
                        left: size.width * 17.13 / 375),
                    child: appBarButton(
                        onPressed: () {}, size: size, icon: MyIcons.search),
                  ),
                ]),
            body: Column(
              children: [
                Container(
                  color: white,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: size.width * 34 / 375,
                      right: size.width * 34 / 375,
                      top: size.height * 20 / 812,
                      bottom: size.height * 18 / 812,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.detectionCost.tr(),
                          style: Fonts.fBold(
                            size: size.height * 17 / 812,
                          ),
                        ),
                        Text('$cost',
                            style: Fonts.fBold(
                              size: size.height * 25 / 812,
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  color: dividerColor,
                  height: size.height * 10 / 812,
                ),
                Expanded(
                  child: SizedBox(
                    width: size.width,
                    height: size.height,
                    child: getSingleClinic == null
                        ? const Center(child: CircularProgressIndicator())
                        : getSingleClinic != null
                            ? getSingleClinic!.data == null
                                ? Center(
                                    child: Text(
                                      getSingleClinic!.message!,
                                      style: Fonts.fBold(
                                          size: size.height * 20 / 812,
                                          color: grey),
                                    ),
                                  )
                                : ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        Container(
                                          color: dividerColor,
                                          height: size.height * 10 / 812,
                                        ),
                                    itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SingleDoctor(
                                                        id: getSingleClinic!
                                                            .data![index].id!,
                                                      )));
                                        },
                                        child: DoctorCard(
                                          clinic: name,
                                          name: getSingleClinic!
                                              .data![index].name!,
                                          years: getSingleClinic!.data![index]
                                                  .previousExperience ??
                                              0,
                                        )),
                                    itemCount: getSingleClinic!.data!.length)
                            : Container(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
