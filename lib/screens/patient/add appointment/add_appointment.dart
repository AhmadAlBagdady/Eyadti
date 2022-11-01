import 'dart:ui';
import 'package:departments/models/appointments/get_available_time.dart';
import 'package:departments/models/appointments/get_available_date.dart';
import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/models/clinic/get_single_clinic.dart';
import 'package:departments/models/department/get_all_departments.dart';
import 'package:departments/screens/patient/add%20appointment/cubit/cubit.dart';
import 'package:departments/screens/patient/add%20appointment/cubit/state.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/drop_down_list.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/widgets/available_times_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddAppointment extends StatelessWidget {
  DateTime? timeDate;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  List<String> items1 = [
    'Im1',
    'Im2',
    'Im3',
    'Im4',
    'Im5',
    'Im6',
    'Im7',
    'Im8',
  ];
  int? doctorId;
  DateTime? date;
  String? time;
  bool? isReview;
  GetDepartments? getDepartments;
  Map<int, String> departmentsMap = {};

  GetClinicsById? getClinicsById;
  Map<int, String> clinicsMap = {};

  GetSingleClinic? getDoctorsById;
  Map<int, String> doctorsMap = {};

  GetAvailableDate? getAvailableDate;
  List<DateTime> datesList = [];

  GetAvailableTime? getAvailableTime;
  List<dynamic> timesList = [];

  // GetSingleClinic?getSingleClinic;
  // List<String>doctorsList=[];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAppointCubit()..getDepartments(),
      child: BlocConsumer<AddAppointCubit, AddAppointState>(
        listener: (context, state) {
          if (state is AddAppointmentGetDepartmentsSuccessState) {
            getDepartments = state.getAllDepartments;
            state.getAllDepartments.data!.asMap().forEach((key, value) {
              departmentsMap[value.id!] = '${key + 1} - ${value.name!}';
            });
          }

          if (state is AddAppointmentGetClinicsByIdSuccessState) {
            getClinicsById = state.getClinicsById;
            state.getClinicsById.data!.asMap().forEach((key, value) {
              clinicsMap[value.id!] = '${key + 1} - ${value.name!}';
            });
          }

          if (state is AddAppointmentGetSingleClinicSuccessState) {
            getDoctorsById = state.getSingleClinic;
            state.getSingleClinic.data!.asMap().forEach((key, value) {
              doctorsMap[value.id!] = '${key + 1} - ${value.name!}';
            });
          }

          if (state is AddAppointmentGetAvailableDateSuccessState) {
            getAvailableDate = state.getAvailableDate;
            state.getAvailableDate.data!
                .forEach((element) => datesList.add(DateTime.parse(element)));
            print(datesList);
          } else if (state is AddAppointmentGetAvailableDateErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }

          if (state is AddAppointmentGetAvailableTimeSuccessState) {
            getAvailableTime = state.getAvailableTime;
            timesList = state.getAvailableTime.data!;
          }

          if(state is AddAppointmentBookAppointmentSuccessState){
            showToast(msg: state.bookAppointment.message!, color: green).then((value){
              Navigator.of(context).pop();
            });
          } else if (state is AddAppointmentBookAppointmentErrorState){
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          AddAppointCubit addAppointCubit = AddAppointCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: size.height * 54 / 812,
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
              elevation: 0,
              titleTextStyle: const TextStyle(fontSize: 20),
              title: Padding(
                padding: EdgeInsets.only(right: size.width * 52.13 / 375),
                child: const Text(
                  'New appointment',
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                      right: size.width * 34.34 / 375,
                      left: size.width * 17.13 / 375),
                  child: appBarButton(
                      onPressed: () {}, size: size, icon: MyIcons.check__1_),
                )
              ],
            ),
            body: getDepartments == null
                ? const Center(child: CircularProgressIndicator())
                : getDepartments!.data == null
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          getDepartments!.message!,
                          style: Fonts.fBold(
                              size: size.height * 20 / 812, color: grey),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.width * 34 / 375,
                              horizontal: size.height * 30 / 812),
                          child: SizedBox(
                            height: size.height - (size.height * 150 / 812),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Spacer(),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () async {
                                        await Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AddAppointment(),
                                          ),
                                        );
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                  'Department',
                                  style: Fonts.fBold(size: 13),
                                ),
                                SizedBox(
                                  height: size.height * 14 / 812,
                                ),
                                Stack(
                                  children: [
                                    dropDownList(
                                        validate: (value) {},
                                        hintText: 'Department',
                                        items: departmentsMap.values.toList(),
                                        selectedValue:
                                            addAppointCubit.selectedDep,
                                        onChanged: (value) {
                                          addAppointCubit
                                              .getClinicsByDepartmentId(
                                                  departmentsMap.keys
                                                      .firstWhere(
                                                          (element) =>
                                                              departmentsMap[
                                                                  element] ==
                                                              value,
                                                          orElse: () => 0));
                                          addAppointCubit.changeSelectedItem(
                                              'Department', value);
                                          addAppointCubit.isSelectDep = false;
                                          addAppointCubit.isSelectClinic = true;
                                        }),
                                    addAppointCubit.isSelectDep
                                        ? Container()
                                        : Container(
                                            color: white.withOpacity(0.6),
                                            width: double.infinity,
                                            height: size.height * 50 / 812,
                                          ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 13 / 812,
                                ),
                                getClinicsById == null
                                    ? Container()
                                    : getClinicsById!.data == null
                                        ? Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              getClinicsById!.message!,
                                              style: Fonts.fBold(
                                                  size: size.height * 20 / 812,
                                                  color: grey),
                                            ),
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'CLINIC',
                                                style: Fonts.fBold(size: 13),
                                              ),
                                              SizedBox(
                                                height: size.height * 14 / 812,
                                              ),
                                              Stack(
                                                children: [
                                                  dropDownList(
                                                      validate: (value) {},
                                                      hintText: 'Clinic',
                                                      items: clinicsMap.values
                                                          .toList(),
                                                      selectedValue:
                                                          addAppointCubit
                                                              .selectedClinic,
                                                      onChanged: (value) {
                                                        addAppointCubit
                                                            .getSingleClinic(clinicsMap
                                                                .keys
                                                                .firstWhere(
                                                                    (element) =>
                                                                        clinicsMap[
                                                                            element] ==
                                                                        value,
                                                                    orElse:
                                                                        () =>
                                                                            0));
                                                        addAppointCubit
                                                            .changeSelectedItem(
                                                                'Clinic',
                                                                value);
                                                        addAppointCubit
                                                                .isSelectClinic =
                                                            false;
                                                        addAppointCubit
                                                                .isSelectDoctor =
                                                            true;
                                                      }),
                                                  addAppointCubit.isSelectClinic
                                                      ? Container()
                                                      : Container(
                                                          color: white
                                                              .withOpacity(0.6),
                                                          width:
                                                              double.infinity,
                                                          height: size.height *
                                                              50 /
                                                              812,
                                                        ),
                                                ],
                                              ),
                                            ],
                                          ),
                                SizedBox(
                                  height: size.height * 13 / 812,
                                ),
                                getDoctorsById == null
                                    ? Container()
                                    : getDoctorsById!.data == null
                                        ? Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              getDoctorsById!.message!,
                                              style: Fonts.fBold(
                                                  size: size.height * 20 / 812,
                                                  color: grey),
                                            ),
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'DOCTOR',
                                                style: Fonts.fBold(size: 13),
                                              ),
                                              SizedBox(
                                                height: size.height * 14 / 812,
                                              ),
                                              Stack(
                                                children: [
                                                  dropDownList(
                                                      validate: (value) {},
                                                      hintText: 'Doctor',
                                                      items: doctorsMap.values
                                                          .toList(),
                                                      selectedValue:
                                                          addAppointCubit
                                                              .selectedDoc,
                                                      onChanged: (value) {
                                                        doctorId = doctorsMap
                                                            .keys
                                                            .firstWhere(
                                                                (element) =>
                                                                    doctorsMap[
                                                                        element] ==
                                                                    value,
                                                                orElse: () =>
                                                                    0);
                                                        addAppointCubit
                                                            .getAvailableDate(
                                                                doctorId!);
                                                        addAppointCubit
                                                            .changeSelectedItem(
                                                                'Doctor',
                                                                value);
                                                        addAppointCubit
                                                                .isSelectDoctor =
                                                            false;
                                                        addAppointCubit
                                                                .isSelectDate =
                                                            true;
                                                      }),
                                                  addAppointCubit.isSelectDoctor
                                                      ? Container()
                                                      : Container(
                                                          color: white
                                                              .withOpacity(0.6),
                                                          width:
                                                              double.infinity,
                                                          height: size.height *
                                                              50 /
                                                              812,
                                                        ),
                                                ],
                                              ),
                                            ],
                                          ),
                                SizedBox(
                                  height: size.height * 13 / 812,
                                ),
                                getAvailableDate == null
                                    ? Container()
                                    : getAvailableDate!.data == null
                                        ? Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              getAvailableDate!.message!,
                                              style: Fonts.fBold(
                                                  size: size.height * 20 / 812,
                                                  color: grey),
                                            ),
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'DATE',
                                                style: Fonts.fBold(size: 13),
                                              ),
                                              SizedBox(
                                                height: size.height * 14 / 812,
                                              ),
                                              Stack(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    height:
                                                        size.height * 48 / 812,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left:
                                                                      size.width *
                                                                          16 /
                                                                          375),
                                                          child: Text(
                                                              addAppointCubit
                                                                          .selectedDate ==
                                                                      null
                                                                  ? ''
                                                                  : DateFormat
                                                                          .yMd()
                                                                      .format(addAppointCubit
                                                                          .selectedDate!),
                                                              style: Fonts.semiBold(
                                                                  size:
                                                                      size.height *
                                                                          14 /
                                                                          812,
                                                                  color: grey)),
                                                        ),
                                                        IconButton(
                                                          onPressed: () async {
                                                            addAppointCubit
                                                                .pickDate(
                                                                    context,
                                                                    datesList)
                                                                .then((value) {
                                                              date = value;
                                                              addAppointCubit
                                                                  .getAvailableTime(
                                                                      convertToDate(
                                                                          value),
                                                                      doctorId!);
                                                              addAppointCubit
                                                                      .isSelectDate =
                                                                  false;
                                                              addAppointCubit
                                                                  .changeSelectedItem(
                                                                      'Date',
                                                                      value);
                                                            });
                                                          },
                                                          icon: const Icon(
                                                            MyIcons.calendar,
                                                            color: grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  addAppointCubit.isSelectDate
                                                      ? Container()
                                                      : Container(
                                                          color: white
                                                              .withOpacity(0.6),
                                                          width:
                                                              double.infinity,
                                                          height: size.height *
                                                              50 /
                                                              812,
                                                        ),
                                                ],
                                              ),
                                            ],
                                          ),
                                SizedBox(
                                  height: size.height * 19 / 812,
                                ),
                                getAvailableTime == null
                                    ? Container()
                                    : getAvailableTime!.data == null
                                        ? Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              getAvailableTime!.message!,
                                              style: Fonts.fBold(
                                                  size: size.height * 20 / 812,
                                                  color: grey),
                                            ),
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'AVAILABLE TIME',
                                                style: Fonts.fBold(size: 13),
                                              ),
                                              AvailableTimeList(
                                                  availableTimesList: timesList,
                                                  cubit: addAppointCubit)
                                            ],
                                          ),
                                Spacer(),
                                MaterialButton(
                                  elevation: 0,
                                  color: green,
                                  onPressed: () {
                                    addAppointCubit.bookAppointment(
                                        doctorId!,
                                        convertToDate(date!),
                                        addAppointCubit.availableTime!,
                                        0);
                                  },
                                  child: Text(
                                    'Add Appointment',
                                    style: Fonts.semiBold(
                                        size: size.height * 20 / 812,
                                        color: white),
                                  ),
                                  height: size.height * 48 / 812,
                                  minWidth: double.infinity,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
          );
        },
      ),
    );
  }
}
