import 'package:departments/models/patient/get_single_patient.dart';
import 'package:departments/screens/shared/single%20patient/cubit/cubit.dart';
import 'package:departments/screens/shared/single%20patient/cubit/state.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/drop_down_list.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/components/simple_info.dart';
import 'package:departments/shared/components/text.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class SinglePatient extends StatelessWidget {
  SinglePatient({required this.patientId});
  int patientId;
  GetSinglePatient? getSinglePatient;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SinglePatientCubit()..getSinglePatient(id: patientId),
      child: BlocConsumer<SinglePatientCubit, SinglePatientState>(
          listener: (context, state) => {
                if (state is SinglePatientGetSinglePatientSuccessState)
                  {getSinglePatient = state.getSinglePatient}
                else if (state is SinglePatientGetSinglePatientErrorState)
                  {showToast(msg: state.errorModel.message!, color: red)}
              },
          builder: (context, state) {
            SinglePatientCubit singlePatientCubit =
                SinglePatientCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: size.height * 54 / 812,
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
                title: getSinglePatient == null
                    ? Container()
                    : getSinglePatient!.data == null
                        ? Container()
                        : Text(
                            getSinglePatient!.data!.firstName ??
                                LocaleKeys.notExist.tr(),
                            style: Fonts.semiBold(
                                size: size.height * 20 / 812, color: white),
                          ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 34.34 / 375),
                    child: Icon(
                      MyIcons.bell,
                      size: size.height * 17.12 / 812,
                    ),
                  )
                ],
              ),
              body: getSinglePatient == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : getSinglePatient!.data == null
                      ? Center(
                          child: Text('No data'),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 34 / 375,
                                    vertical: size.height * 19 / 812),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: darkBlue,
                                                  width:
                                                      size.height * 3 / 812)),
                                          child: CircleAvatar(
                                            radius: size.width * 44 / 375,
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
                                            SizedBox(
                                              height: size.height * 10 / 812,
                                            ),
                                            Text(
                                                getSinglePatient!
                                                        .data!.firstName ??
                                                    LocaleKeys.notExist.tr(),
                                                style: Fonts.fBold(
                                                    size: 14, color: darkBlue)),
                                            SizedBox(
                                                height: size.height * 2 / 758),
                                            Row(
                                              children: [
                                                Icon(
                                                  MyIcons.call_outgoing__1_,
                                                  color: grey,
                                                  size:
                                                      size.height * 10.47 / 812,
                                                ),
                                                SizedBox(
                                                  width:
                                                      size.width * 4.53 / 375,
                                                ),
                                                Text(
                                                  getSinglePatient!
                                                          .data!.phoneNumber ??
                                                      LocaleKeys.notExist.tr(),
                                                  style: Fonts.fRegular(
                                                      size: 13, color: grey),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 24 / 812,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        simpleInfo(
                                            icon: Icons.work,
                                            title: LocaleKeys.appoint.tr(),
                                            content: getSinglePatient!
                                                    .data!.appointmentCount ??
                                                0),
                                        simpleInfo(
                                            icon: Icons.work,
                                            title: LocaleKeys.gender.tr(),
                                            content: getSinglePatient!
                                                        .data!.gender ==
                                                    1
                                                ? LocaleKeys.male.tr()
                                                : LocaleKeys.female.tr()),
                                        simpleInfo(
                                            icon: Icons.work,
                                            title: LocaleKeys.age.tr(),
                                            content:
                                                getSinglePatient!.data!.age ??
                                                    0),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: dividerColor,
                                height: size.height * 10 / 812,
                              ),
                              InkWell(
                                onTap: () {
                                  singlePatientCubit
                                      .changeSecure('isGeneralInfo');
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 7 / 812,
                                      horizontal: size.width * 34 / 375),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'General info',
                                        style: Fonts.fBold(
                                          size: 13,
                                        ),
                                      ),
                                      Transform(
                                          alignment: Alignment.center,
                                          transform:
                                              singlePatientCubit.isGeneralInfo
                                                  ? Matrix4.rotationZ(
                                                      math.pi * -1 / 2)
                                                  : Matrix4.rotationY(math.pi),
                                          child: InkWell(
                                            onTap: () {
                                              singlePatientCubit.changeSecure(
                                                  'isGeneralInfo');
                                            },
                                            child: Icon(
                                              MyIcons.angle_left,
                                              size: 13,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: dividerColor,
                                height: size.height * 10 / 812,
                              ),
                              singlePatientCubit.isGeneralInfo
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          right: size.width * 34 / 375,
                                          left: size.width * 34 / 375,
                                          top: size.height * 22 / 812,
                                          bottom: size.height * 28 / 812),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${LocaleKeys.fatherName.tr()}',
                                            style: Fonts.fBold(size: 13),
                                          ),
                                          SizedBox(
                                            height: size.height * 14 / 812,
                                          ),
                                          Container(
                                            height: size.height * 48 / 812,
                                            decoration: BoxDecoration(
                                              color: lightGrey.withOpacity(.3),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(
                                                getSinglePatient!
                                                        .data!.fatherName ??
                                                    LocaleKeys.notExist.tr(),
                                                style: Fonts.fBold(
                                                    size:
                                                        size.height * 14 / 812,
                                                    color: grey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 17 / 812,
                                          ),
                                          Text(
                                            LocaleKeys.lastName.tr(),
                                            style: Fonts.fBold(size: 13),
                                          ),
                                          SizedBox(
                                            height: size.height * 14 / 812,
                                          ),
                                          Container(
                                            height: size.height * 48 / 812,
                                            decoration: BoxDecoration(
                                              color: lightGrey.withOpacity(.3),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(
                                                getSinglePatient!
                                                        .data!.lastName ??
                                                    LocaleKeys.notExist.tr(),
                                                style: Fonts.fBold(
                                                    size:
                                                        size.height * 14 / 812,
                                                    color: grey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 17 / 812,
                                          ),
                                          Text(
                                            LocaleKeys.birthDate.tr(),
                                            style: Fonts.fBold(size: 13),
                                          ),
                                          SizedBox(
                                            height: size.height * 14 / 812,
                                          ),
                                          Container(
                                            height: size.height * 48 / 812,
                                            decoration: BoxDecoration(
                                              color: lightGrey.withOpacity(.3),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(
                                                getSinglePatient!
                                                        .data!.birthDate ??
                                                    LocaleKeys.notExist.tr(),
                                                style: Fonts.fBold(
                                                    size:
                                                        size.height * 14 / 812,
                                                    color: grey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 17 / 812,
                                          ),
                                          Text(
                                            LocaleKeys.gender.tr(),
                                            style: Fonts.fBold(size: 13),
                                          ),
                                          SizedBox(
                                            height: size.height * 14 / 812,
                                          ),
                                          Container(
                                            height: size.height * 48 / 812,
                                            decoration: BoxDecoration(
                                              color: lightGrey.withOpacity(.3),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(
                                                getSinglePatient!
                                                            .data!.gender ==
                                                        1
                                                    ? LocaleKeys.male.tr()
                                                    : LocaleKeys.female.tr(),
                                                style: Fonts.fBold(
                                                    size:
                                                        size.height * 14 / 812,
                                                    color: grey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 17 / 812,
                                          ),
                                          Text(
                                            LocaleKeys.contactNumbers.tr(),
                                            style: Fonts.fBold(size: 13),
                                          ),
                                          SizedBox(
                                            height: size.height * 14 / 812,
                                          ),
                                          Container(
                                            height: size.height * 48 / 812,
                                            decoration: BoxDecoration(
                                              color: lightGrey.withOpacity(.3),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(
                                                getSinglePatient!
                                                        .data!.phoneNumber ??
                                                    LocaleKeys.notExist.tr(),
                                                style: Fonts.fBold(
                                                    size:
                                                        size.height * 14 / 812,
                                                    color: grey),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 17 / 812,
                                          ),
                                          Text(
                                            LocaleKeys.emailAddress.tr(),
                                            style: Fonts.fBold(size: 13),
                                          ),
                                          SizedBox(
                                            height: size.height * 14 / 812,
                                          ),
                                          Container(
                                            height: size.height * 48 / 812,
                                            decoration: BoxDecoration(
                                              color: lightGrey.withOpacity(.3),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(
                                                getSinglePatient!.data!.email ??
                                                    LocaleKeys.notExist.tr(),
                                                style: Fonts.fBold(
                                                    size:
                                                        size.height * 14 / 812,
                                                    color: grey),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              singlePatientCubit.isGeneralInfo
                                  ? Container(
                                      color: dividerColor,
                                      height: size.height * 10 / 812,
                                    )
                                  : Container(),
                              InkWell(
                                onTap: () {
                                  singlePatientCubit
                                      .changeSecure('isHealthyInfo');
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 7 / 812,
                                      horizontal: size.width * 34 / 375),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Healthy info',
                                        style: Fonts.fBold(
                                          size: 13,
                                        ),
                                      ),
                                      Transform(
                                          alignment: Alignment.center,
                                          transform:
                                              singlePatientCubit.isHealthyInfo
                                                  ? Matrix4.rotationZ(
                                                      math.pi * -1 / 2)
                                                  : Matrix4.rotationY(math.pi),
                                          child: InkWell(
                                            onTap: () {
                                              singlePatientCubit.changeSecure(
                                                  'isHealthyInfo');
                                            },
                                            child: Icon(
                                              MyIcons.angle_left,
                                              size: 13,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: dividerColor,
                                height: size.height * 10 / 812,
                              ),
                              singlePatientCubit.isHealthyInfo
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 34 / 375,
                                          vertical: size.height * 22 / 812),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                LocaleKeys.height.tr(),
                                                style: Fonts.fBold(size: 13),
                                              ),
                                              SizedBox(
                                                width: size.width * 123 / 375,
                                              ),
                                              Text(
                                                LocaleKeys.weight.tr(),
                                                style: Fonts.fBold(size: 13),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 14 / 812,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: size.height * 48 / 812,
                                                width: size.width * 141 / 375,
                                                child: Container(
                                                  height:
                                                      size.height * 48 / 812,
                                                  decoration: BoxDecoration(
                                                    color: lightGrey
                                                        .withOpacity(.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${getSinglePatient!.data!.height}',
                                                      style: Fonts.fBold(
                                                          size: size.height *
                                                              14 /
                                                              812,
                                                          color: grey),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 24 / 375,
                                              ),
                                              SizedBox(
                                                height: size.height * 48 / 812,
                                                width: size.width * 141 / 375,
                                                child: Container(
                                                  height:
                                                      size.height * 48 / 812,
                                                  decoration: BoxDecoration(
                                                    color: lightGrey
                                                        .withOpacity(.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${getSinglePatient!.data!.weight}',
                                                      style: Fonts.fBold(
                                                          size: size.height *
                                                              14 /
                                                              812,
                                                          color: grey),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 14 / 812,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                LocaleKeys.bloodGroup.tr(),
                                                style: Fonts.fBold(size: 13),
                                              ),
                                              SizedBox(
                                                width: size.width * 89 / 375,
                                              ),
                                              Text(
                                                LocaleKeys.allergy.tr(),
                                                style: Fonts.fBold(size: 13),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 14 / 812,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: size.height * 48 / 812,
                                                width: size.width * 141 / 375,
                                                child: Container(
                                                  height:
                                                      size.height * 48 / 812,
                                                  decoration: BoxDecoration(
                                                    color: lightGrey
                                                        .withOpacity(.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      getSinglePatient!.data!
                                                              .allergies ??
                                                          LocaleKeys.notExist
                                                              .tr(),
                                                      style: Fonts.fBold(
                                                          size: size.height *
                                                              14 /
                                                              812,
                                                          color: grey),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 24 / 375,
                                              ),
                                              SizedBox(
                                                height: size.height * 48 / 812,
                                                width: size.width * 141 / 375,
                                                child: Container(
                                                  height:
                                                      size.height * 48 / 812,
                                                  decoration: BoxDecoration(
                                                    color: lightGrey
                                                        .withOpacity(.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      getSinglePatient!.data!
                                                              .bloodGroup ??
                                                          LocaleKeys.notExist
                                                              .tr(),
                                                      style: Fonts.fBold(
                                                          size: size.height *
                                                              14 /
                                                              812,
                                                          color: grey),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 14 / 812,
                                          ),
                                          Text(
                                            LocaleKeys.chronicDiseases.tr(),
                                            style: Fonts.fBold(size: 13),
                                          ),
                                          SizedBox(
                                            height: size.height * 14 / 812,
                                          ),
                                          Container(
                                            height: size.height * 48 / 812,
                                            decoration: BoxDecoration(
                                              color: lightGrey.withOpacity(.3),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(
                                                getSinglePatient!
                                                        .data!.diseases ??
                                                    LocaleKeys.notExist.tr(),
                                                style: Fonts.fBold(
                                                    size:
                                                        size.height * 14 / 812,
                                                    color: grey),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
            );
          }),
    );
  }
}
