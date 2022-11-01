import 'package:departments/models/certificates/get_certificates_by_id.dart';
import 'package:departments/models/nurse/get_single_nurse.dart';
import 'package:departments/models/working%20times/get_working_times_by_id.dart';
import 'package:departments/screens/doctor/single%20nurse/cubit/cubit.dart';
import 'package:departments/screens/doctor/single%20nurse/cubit/state.dart';
import 'package:departments/shared/components/button_drop_down.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/components/simple_info.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/custom_certificate_card.dart';
import 'package:departments/shared/widgets/custom_working_times.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleNurse extends StatelessWidget {
  SingleNurse({required this.id});

  int id;
  GetSingleNurse? getSingleNurse;
  GetCertificatesById? getCertificatesById;
  GetWorkingTimesById? getWorkingTimesById;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleNurseCubit()
        ..getSingleNurse(id: id)
        ..getCertificatesNurse(id: id)
        ..getWorkingTimesNurse(id: id),
      child: BlocConsumer<SingleNurseCubit, SingleNurseState>(
          listener: (context, state) {
        if (state is SingleNurseGetSingleNurseSuccessState) {
          getSingleNurse = state.getSingleNurse;
        } else if (state is SingleNurseGetSingleNurseErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
        if (state is SingleNurseGetCertificatesNurseSuccessState) {
          getCertificatesById = state.getCertificatesById;
        } else if (state is SingleNurseGetCertificatesNurseErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
        if (state is SingleNurseGetWorkingTimesNurseSuccessState) {
          getWorkingTimesById = state.getWorkingTimesById;
          if (getWorkingTimesById != null) {
            if (getWorkingTimesById!.data != null) {}
          }
        } else if (state is SingleNurseGetWorkingTimesNurseErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
      }, builder: (context, state) {
        SingleNurseCubit singleNurseCubit = SingleNurseCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(left: size.width / 14),
              child: appBarButton(
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                  size: size,
                  icon: MyIcons.angle_left),
            ),
            toolbarHeight: size.height * 54 / 758,
            backgroundColor: lightBlue,
            titleTextStyle: TextStyle(fontSize: 20),
            title: Padding(
              padding: EdgeInsets.only(right: size.width * 52.13 / 375),
              child: getSingleNurse == null
                  ? const CircularProgressIndicator()
                  : getSingleNurse!.data == null
                      ? Text(
                          getSingleNurse!.message!,
                          style: Fonts.fBold(
                              size: size.height * 20 / 812, color: grey),
                        )
                      : Text(
                          getSingleNurse!.data!.nurseName ?? LocaleKeys.notExist.tr(),
                          style: Fonts.semiBold(size: 20, color: white),
                        ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 17.99 / 375,
                    right: size.width * 34.34 / 375),
                child: Icon(
                  MyIcons.bell,
                  size: size.width * 16.31 / 375,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSingleNurse == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : getSingleNurse!.data == null
                        ? Center(
                            child: Text(
                              getSingleNurse!.message!,
                              style: Fonts.fBold(
                                  size: size.height * 20 / 812, color: grey),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 34 / 375,
                                vertical: size.height * 19 / 758),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: size.width * 46 / 375,
                                      backgroundColor: darkBlue,
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
                                        Text(
                                            getSingleNurse!.data!.nurseName ??
                                                LocaleKeys.notExist.tr(),
                                            style: Fonts.fBold(
                                                size: size.height * 14 / 812,
                                                color: darkBlue)),
                                        SizedBox(height: size.height * 2 / 758),
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
                                                getSingleNurse!
                                                        .data!.phoneNumber ??
                                                    LocaleKeys.notExist.tr(),
                                                style: Fonts.fRegular(
                                                    size:
                                                        size.height * 13 / 812,
                                                    color: grey),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 24 / 758,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    simpleInfo(
                                        icon: Icons.shopping_bag,
                                        title: LocaleKeys.experience.tr(),
                                        content:
                                            '${getSingleNurse!.data!.previousExperience ?? LocaleKeys.notExist.tr()} ${LocaleKeys.years.tr().toLowerCase()}'),
                                    simpleInfo(
                                        icon: MyIcons.male,
                                        title: LocaleKeys.gender.tr(),
                                        content:
                                            getSingleNurse!.data!.gender == 1
                                                ? LocaleKeys.male.tr()
                                                : LocaleKeys.female.tr()),
                                    simpleInfo(
                                        icon: Icons.shopping_bag,
                                        title: LocaleKeys.age.tr(),
                                        content:
                                            '${getSingleNurse!.data!.age ?? LocaleKeys.notExist.tr()} ${LocaleKeys.old.tr().toLowerCase()}'),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 24 / 812,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      LocaleKeys.workingDays.tr().toUpperCase(),
                                      style: Fonts.fBold(
                                        size: size.height * 13 / 812,
                                      ),
                                    ),
                                    Text(
                                      '${LocaleKeys.slotTime.tr()} 30m',
                                      style: Fonts.fRegular(
                                          size: size.height * 13 / 812,
                                          color: lightGrey),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 14 / 812,
                                ),
                                getWorkingTimesById == null
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : getWorkingTimesById!.data == null
                                        ? Center(
                                            child: Text(
                                              getWorkingTimesById!.message!,
                                              style: Fonts.fBold(
                                                  size: size.height * 20 / 812,
                                                  color: grey),
                                            ),
                                          )
                                        : SizedBox(
                                            width: size.width,
                                            child: ListView.separated(
                                                itemCount: 3,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                          height: size.height *
                                                              13 /
                                                              812,
                                                        ),
                                                itemBuilder: (context, index) =>
                                                    WorkingTimes(
                                                      workDays: [
                                                        'sa',
                                                        'su',
                                                        'f'
                                                      ],
                                                      listOfWorkingTimes: [],
                                                    )),
                                          ),
                                SizedBox(
                                  height: size.height * 13 / 812,
                                ),
                              ],
                            ),
                          ),
                buttonDropDown(
                    LocaleKeys.certificates.tr().toUpperCase(), singleNurseCubit.isNurseArrowClicked, () {
                  singleNurseCubit.changeShowingList();
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
                        : singleNurseCubit.isNurseArrowClicked
                            ? SizedBox(
                                width: size.width,
                                child: ListView.separated(
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
                                              LocaleKeys.notExist.tr(),
                                          certificateName: getCertificatesById!
                                                  .certificates![index]
                                                  .certificateName ??
                                              LocaleKeys.notExist.tr(),
                                          certificateRating:
                                              getCertificatesById!
                                                      .certificates![index]
                                                      .certificateRating ??
                                                  LocaleKeys.notExist.tr(),
                                          certificateSource:
                                              getCertificatesById!
                                                      .certificates![index]
                                                      .certificateSource ??
                                                  LocaleKeys.notExist.tr(),
                                          country: getCertificatesById!
                                                  .certificates![index]
                                                  .country ??
                                              LocaleKeys.notExist.tr(),
                                        ),
                                    itemCount: getCertificatesById!
                                        .certificates!.length),
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
