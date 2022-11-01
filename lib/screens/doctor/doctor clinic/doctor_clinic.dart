import 'package:departments/models/clinic/get_my_clinic.dart';
import 'package:departments/screens/doctor/doctor%20clinic/cubit/cubit.dart';
import 'package:departments/screens/doctor/doctor%20clinic/cubit/state.dart';
import 'package:departments/screens/doctor/single%20nurse/single_nurse.dart';
import 'package:departments/screens/shared/single%20doctor/single_doctor.dart';
import 'package:departments/shared/components/button_drop_down.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/custom_app_bar.dart';
import 'package:departments/shared/widgets/doctor_card.dart';
import 'package:departments/shared/widgets/nurse_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorClinic extends StatelessWidget {
  DoctorClinic({Key? key}) : super(key: key);

  GetMyClinic? getMyClinic;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorClinicCubit()..getMyClinic(),
      child: BlocConsumer<DoctorClinicCubit, DoctorClinicState>(
          listener: (context, state) {
        if (state is DoctorClinicGetMyClinicSuccessState) {
          getMyClinic = state.getMyClinic;
        } else if (state is DoctorClinicGetMyClinicErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
      }, builder: (context, state) {
        DoctorClinicCubit doctorClinicCubit = DoctorClinicCubit.get(context);
        return Scaffold(
          backgroundColor: white,
          appBar: CustomAppBar(title: LocaleKeys.myClinic.tr()),
          body: SingleChildScrollView(
            child: getMyClinic == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Padding(
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
                              style: Fonts.fBold(size: size.height * 13 / 812),
                            ),
                            Text(
                                '${getMyClinic!.data!.sessionPrice} ${LocaleKeys.sP.tr()}',
                                style: Fonts.fBold(
                                  size: size.height * 25 / 812,
                                ))
                          ],
                        ),
                      ),
                      buttonDropDown(LocaleKeys.doctors.tr().toUpperCase(),
                          doctorClinicCubit.isDoctorArrowClicked, () {
                        doctorClinicCubit.changeShowingList('doctor');
                      }),
                      doctorClinicCubit.isDoctorArrowClicked
                          ? Container(
                              color: dividerColor,
                              height: size.height * 10 / 812,
                            )
                          : Container(),
                      doctorClinicCubit.isDoctorArrowClicked
                          ? SizedBox(
                              width: size.width,
                              child: getMyClinic!.data!.listOfDoctors == null
                                  ? Padding(
                                      padding: EdgeInsets.all(
                                          size.height * 20.0 / 812),
                                      child: Center(
                                        child: Text(
                                          LocaleKeys.noDoctors.tr(),
                                          style: Fonts.fBold(
                                              size: size.height * 20 / 812,
                                              color: grey),
                                        ),
                                      ),
                                    )
                                  : ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
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
                                                            id: getMyClinic!
                                                                .data!
                                                                .listOfDoctors![
                                                                    index]
                                                                .id!,
                                                          )));
                                            },
                                            child: DoctorCard(
                                              clinic: getMyClinic!
                                                  .data!
                                                  .listOfDoctors![index]
                                                  .clinicName!,
                                              name: getMyClinic!.data!
                                                  .listOfDoctors![index].name!,
                                              years: getMyClinic!
                                                  .data!
                                                  .listOfDoctors![index]
                                                  .previousExperience!,
                                            ),
                                          ),
                                      itemCount: getMyClinic!
                                          .data!.listOfDoctors!.length),
                            )
                          : Container(),
                      buttonDropDown(LocaleKeys.nurses.tr().toUpperCase(),
                          doctorClinicCubit.isNurseArrowClicked, () {
                        doctorClinicCubit.changeShowingList('nurse');
                      }),
                      Container(
                        color: dividerColor,
                        height: size.height * 10 / 812,
                      ),
                      doctorClinicCubit.isNurseArrowClicked
                          ? SizedBox(
                              width: size.width,
                              child: getMyClinic!.data!.listOfNurses == null
                                  ? Padding(
                                      padding: EdgeInsets.all(
                                          size.height * 20.0 / 812),
                                      child: Center(
                                        child: Text(
                                          LocaleKeys.noNurses.tr(),
                                          style: Fonts.fBold(
                                              size: size.height * 20 / 812,
                                              color: grey),
                                        ),
                                      ),
                                    )
                                  : ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) =>
                                          Container(),
                                      itemBuilder: (context, index) =>
                                          NurseCard(
                                            id: getMyClinic!
                                                .data!.listOfNurses![index].id!,
                                            name: getMyClinic!.data!
                                                .listOfNurses![index].name!,
                                            clinic: getMyClinic!
                                                .data!
                                                .listOfNurses![index]
                                                .clinicName!,
                                            years: getMyClinic!
                                                .data!
                                                .listOfNurses![index]
                                                .previousExperience!,
                                          ),
                                      itemCount: getMyClinic!
                                          .data!.listOfNurses!.length),
                            )
                          : Container(),
                      SizedBox(
                        height: size.height * 70 / 812,
                      )
                    ],
                  ),
          ),
        );
      }),
    );
  }
}
