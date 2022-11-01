import 'package:departments/layout/doctor/doctorCubit/cubit.dart';
import 'package:departments/models/doctor/get_all_doctors.dart';
import 'package:departments/screens/shared/doctors/cubit/cubit.dart';
import 'package:departments/screens/shared/doctors/cubit/state.dart';
import 'package:departments/screens/shared/notifications/notifications.dart';
import 'package:departments/screens/shared/search/search.dart';
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

class Doctors extends StatelessWidget {
  Doctors({
    Key? key,
    this.doctorsList,
  }) : super(key: key);
  List<Doctor>? doctorsList;
  bool isCreated = false;
  GetAllDoctors? getAllDoctors;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorsCubit(),
      child: BlocConsumer<DoctorsCubit, DoctorsState>(
        listener: (context, state) {
          if (state is DoctorsGetDoctorsSuccessState) {
            doctorsList = state.getAllDoctors.data;
          } else if (state is DoctorsGetDoctorsErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          if (doctorsList == null && !isCreated) {
            DoctorsCubit.get(context).getDoctors();
            isCreated = true;
          }
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
                    LocaleKeys.doctors.tr(),
                    style: Fonts.semiBold(
                        size: size.height * 20 / 812, color: white),
                  ),
                ),
                actions: [
                  appBarButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Search(
                                  searchType: 'doctors',
                                )));
                      },
                      size: size,
                      icon: MyIcons.search),
                  Padding(
                    padding: EdgeInsets.only(
                        right: size.width * 34.34 / 375,
                        left: size.width * 17.13 / 375),
                    child: appBarButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Notifications()));
                        },
                        size: size,
                        icon: MyIcons.bell),
                  ),
                ]),
            body: SizedBox(
              width: size.width,
              height: size.height,
              child: doctorsList == null
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      separatorBuilder: (context, index) => Container(
                            color: dividerColor,
                            height: size.height * 10 / 812,
                          ),
                      itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SingleDoctor(
                                      id: doctorsList![index].id!,
                                    )));
                          },
                          child: DoctorCard(
                            clinic: doctorsList![index].clinicName!,
                            name: doctorsList![index].name!,
                            years: doctorsList![index].previousExperience ?? 0,
                          )),
                      itemCount: doctorsList!.length),
            ),
          );
        },
      ),
    );
  }
}
