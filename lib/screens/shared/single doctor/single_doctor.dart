import 'package:departments/models/certificates/get_certificates_by_id.dart';
import 'package:departments/models/doctor/get_doctor_by_id.dart';
import 'package:departments/models/working%20times/get_working_times_by_id.dart';
import 'package:departments/models/doctor/set_rating_doctor_by_id.dart';
import 'package:departments/screens/patient/add%20appointment/add_appointment.dart';
import 'package:departments/screens/shared/notifications/notifications.dart';
import 'package:departments/screens/shared/single%20doctor/cubit/cubit.dart';
import 'package:departments/screens/shared/single%20doctor/cubit/state.dart';
import 'package:departments/shared/components/button_drop_down.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/custom_certificate_card.dart';
import 'package:departments/shared/widgets/custom_work_days.dart';
import 'package:departments/shared/widgets/custom_work_hours.dart';
import 'package:departments/shared/widgets/custom_working_times.dart';
import 'package:departments/shared/widgets/doctor_simple_info.dart';
import 'package:departments/shared/widgets/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleDoctor extends StatelessWidget {
  SingleDoctor({Key? key, required this.id}) : super(key: key);

  final int id;
  GetDoctorById? getDoctorById;
  GetCertificatesById? getCertificatesById;
  GetWorkingTimesById? getWorkingTimesById;
  SetRatingDoctorById? setRatingDoctorById;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleDoctorCubit()
        ..getSingleDoctor(id: id)
        ..getCertificatesDoctor(id: id)
        ..getWorkingTimesDoctor(id: id),
      child: BlocConsumer<SingleDoctorCubit, SingleDoctorState>(
          listener: (context, state) {
        if (state is SingleDoctorGetSingleDoctorSuccessState) {
          getDoctorById = state.getDoctorById;
        } else if (state is SingleDoctorGetSingleDoctorErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
        if (state is SingleDoctorGetCertificatesDoctorSuccessState) {
          getCertificatesById = state.getCertificatesById;
        } else if (state is SingleDoctorGetCertificatesDoctorErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
        if (state is SingleDoctorGetWorkingTimesDoctorSuccessState) {
          getWorkingTimesById = state.getWorkingTimesById;
          if (getWorkingTimesById != null) {
            if (getWorkingTimesById!.data != null) {
              initializeDays(
                  sun: getWorkingTimesById!.data!.sunday ?? [{}],
                  mon: getWorkingTimesById!.data!.monday ?? [],
                  tue: getWorkingTimesById!.data!.tuesday ?? [],
                  wen: getWorkingTimesById!.data!.wednesday ?? [],
                  thi: getWorkingTimesById!.data!.thursday ?? [],
                  fri: getWorkingTimesById!.data!.friday ?? [],
                  sat: getWorkingTimesById!.data!.saturday ?? []);
            }
          }
        } else if (state is SingleDoctorGetWorkingTimesDoctorErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
        if (state is SingleDoctorSetRatingDoctorSuccessState) {
          showToast(msg: state.setRatingDoctorById.message!, color: green);
          setRatingDoctorById = state.setRatingDoctorById;
        } else if (state is SingleDoctorSetRatingDoctorErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
      }, builder: (context, state) {
        SingleDoctorCubit singleDoctorCubit = SingleDoctorCubit.get(context);
        return Scaffold(
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
                  getDoctorById == null
                      ? ''
                      : getDoctorById!.data!.doctorName ?? 'no name',
                  style: Fonts.semiBold(
                      size: size.height * 20 / 812, color: Colors.white),
                ),
              ),
              actions: [
                appBarButton(
                    onPressed: () async {
                      final Uri launcherUri =
                          Uri(scheme: 'tel', path: '0930716527');
                      await launchUrl(launcherUri);
                    },
                    size: size,
                    icon: MyIcons.call_outgoing),
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
          body: Container(
            color: white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 34 / 375,
                        vertical: size.height * 19 / 812),
                    child: getDoctorById == null
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : getDoctorById!.data == null
                            ? Center(
                                child: Text(getDoctorById!.message!),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: darkBlue,
                                                width: size.width * 2 / 375)),
                                        child: CircleAvatar(
                                          radius: size.width * 41.5 / 375,
                                          backgroundColor: white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 19 / 375,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(getDoctorById!.data!.doctorName!,
                                              style: Fonts.fBold(
                                                  size: size.height * 14 / 812,
                                                  color: darkBlue)),
                                          SizedBox(
                                              height: size.height * 2 / 758),
                                          Text(getDoctorById!.data!.clinicName!,
                                              style: Fonts.fBold(
                                                  size: size.height * 13 / 812,
                                                  color: lightGrey)),
                                          SizedBox(
                                            height: size.height * 4 / 758,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                MyIcons.call_outgoing__1_,
                                                size: size.width * 10.47 / 375,
                                                color: grey,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: size.width * 5 / 375),
                                                child: Text(
                                                  getDoctorById!.data!.phones ==
                                                          null
                                                      ? 'no phone'
                                                      : getDoctorById!
                                                              .data!
                                                              .phones![0]
                                                              .phoneNumber ??
                                                          'no phone',
                                                  style: Fonts.fRegular(
                                                      size: size.height *
                                                          13 /
                                                          812,
                                                      color: grey),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  RatingDialog(
                                                    doctorName: getFirstWord(
                                                      getDoctorById!
                                                          .data!.doctorName!,
                                                    ),
                                                    onPressedContinue: () {
                                                      singleDoctorCubit
                                                          .setRatingDoctor(
                                                              doctorId: id,
                                                              ratingId:
                                                                  singleDoctorCubit
                                                                          .ratingId ??
                                                                      6);
                                                      Navigator.pop(context);
                                                    },
                                                    onRatingChanged: (rating) {
                                                      singleDoctorCubit
                                                          .changeComplement(
                                                              (rating / 2)
                                                                  .floor());
                                                      singleDoctorCubit
                                                          .changeRatingId(
                                                              rating.toInt() *
                                                                  2);
                                                      print(rating.toInt() * 2);
                                                    },
                                                    complement:
                                                        singleDoctorCubit
                                                            .complement,
                                                  ));
                                        },
                                        child: Icon(
                                          Icons.star_border_rounded,
                                          color: Colors.blueAccent,
                                          size: size.height * 30 / 812,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 24 / 812,
                                  ),
                                  DoctorSimpleInfo(
                                    exp: getDoctorById!
                                        .data!.previousExperience!,
                                    patientCount:
                                        getDoctorById!.data!.patientCount!,
                                    phoneNum:
                                        getDoctorById!.data!.phones == null
                                            ? 'no phone'
                                            : getDoctorById!.data!.phones![0]
                                                    .phoneNumber ??
                                                'no phone',
                                    age: getDoctorById!.data!.age!,
                                    appointCount:
                                        getDoctorById!.data!.appointmentCount!,
                                    gender: getDoctorById!.data!.gender == 1
                                        ? 'Male'
                                        : 'Female',
                                  ),
                                  SizedBox(
                                    height: size.height * 39 / 812,
                                  ),
                                  role == 'Patient'
                                      ? MaterialButton(
                                          elevation: 0,
                                          minWidth: double.infinity,
                                          height: size.height * 48 / 812,
                                          color: green,
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddAppointment()));
                                          },
                                          child: Text('Add appointment',
                                              style: Fonts.semiBold(
                                                  size: size.height * 20 / 812,
                                                  color: white)),
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: size.height * 28 / 812,
                                  ),
                                  Divider(
                                    color: lightBlue,
                                    height: size.height * 2 / 812,
                                  ),
                                  SizedBox(
                                    height: size.height * 24 / 812,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'WORKING DAYS',
                                        style: Fonts.fBold(
                                          size: size.height * 13 / 812,
                                        ),
                                      ),
                                      Text(
                                        'Slot time: 30m',
                                        style: Fonts.fRegular(
                                            size: size.height * 13 / 812,
                                            color: lightGrey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 14 / 812,
                                  ),
                                  SizedBox(
                                    width: size.width,
                                    child: ListView.separated(
                                        itemCount: 1,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              height: size.height * 13 / 812,
                                            ),
                                        itemBuilder: (context, index) =>
                                            WorkingTimes(
                                              workDays: ['sa', 'su', 'th'],
                                              listOfWorkingTimes: [
                                                ['4:00', '6:00']
                                              ],
                                            )),
                                  ),
                                  SizedBox(
                                    height: size.height * 13 / 812,
                                  ),
                                ],
                              ),
                  ),
                  buttonDropDown(
                      'CERTIFICATES', singleDoctorCubit.isDoctorArrowClicked,
                      () {
                    singleDoctorCubit.changeShowingList();
                  }),
                  Container(
                    color: dividerColor,
                    height: size.height * 10 / 812,
                  ),
                  getCertificatesById == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : getCertificatesById!.certificates == null
                          ? Center(
                              child: Text(
                                getCertificatesById!.message!,
                                style: Fonts.fBold(
                                    size: size.height * 20 / 812, color: grey),
                              ),
                            )
                          : singleDoctorCubit.isDoctorArrowClicked
                              ? SizedBox(
                                  width: size.width,
                                  child: ListView.separated(
                                    itemCount: getCertificatesById!
                                        .certificates!.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) =>
                                        Container(
                                      color: dividerColor,
                                      height: size.height * 10 / 812,
                                    ),
                                    itemBuilder: (context, index) =>
                                        CertificateCard(
                                      certificateDate: getCertificatesById!
                                              .certificates![index]
                                              .certificateDate ??
                                          'no date',
                                      certificateName: getCertificatesById!
                                              .certificates![index]
                                              .certificateName ??
                                          'no name',
                                      certificateRating: getCertificatesById!
                                              .certificates![index]
                                              .certificateRating ??
                                          'no rating',
                                      certificateSource: getCertificatesById!
                                              .certificates![index]
                                              .certificateSource ??
                                          'no source',
                                      country: getCertificatesById!
                                              .certificates![index].country ??
                                          'no country',
                                    ),
                                  ),
                                )
                              : Container()
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
