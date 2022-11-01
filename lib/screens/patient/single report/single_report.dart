import 'package:departments/models/reports/get_single_report.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/custom_prescription_details.dart';
import 'package:departments/shared/widgets/custom_invoice_details.dart';
import 'package:departments/screens/patient/single%20report/cubit/cubit.dart';
import 'package:departments/screens/patient/single%20report/cubit/state.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/widgets/person_details.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SingleReport extends StatelessWidget {
  SingleReport({Key? key, required this.id, required this.appointmentDate})
      : super(key: key);

  final int id;
  final String appointmentDate;

  GetSingleReport? getSingleReport;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SingleReportCubit()..getSingleReport(id: id);
      },
      child: BlocConsumer<SingleReportCubit, SingleReportState>(
        listener: (context, state) {
          if (state is SingleReportGetSingleReportSuccessState) {
            getSingleReport = state.getSingleReport;
          } else if (state is SingleReportGetSingleReportErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: size.height * 54 / 812,
              backgroundColor: lightBlue,
              title: Text(
                appointmentDate,
                style:
                    Fonts.semiBold(size: size.height * 20 / 812, color: white),
              ),
              leading: Padding(
                padding: EdgeInsets.only(left: size.width / 14),
                child: appBarButton(
                    onPressed: () {
                      Navigator.of(context).pop(context);
                    },
                    size: size,
                    icon: MyIcons.angle_left),
              ),
              actions: [
                Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 17.99 / 375,
                        right: size.width * 34.34 / 375),
                    child: appBarButton(
                        onPressed: () {
                        },
                        size: size,
                        icon: MyIcons.envelope))
              ],
            ),
            body: getSingleReport == null
                ? const Center(child: CircularProgressIndicator())
                : getSingleReport!.data == null
                    ? Center(
                        child: Text(
                          getSingleReport!.message!,
                          style: Fonts.fBold(
                              size: size.height * 20 / 812, color: grey),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 34 / 375,
                                right: size.width * 33 / 375,
                                top: size.height * 20 / 812,
                                bottom: size.height * 10 / 812,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(LocaleKeys.sessionDate.tr(),
                                      style: Fonts.fBold(
                                          size: size.height * 14 / 812)),
                                  SizedBox(
                                    width: size.width * 6 / 375,
                                  ),
                                  Text(appointmentDate,
                                      style: Fonts.fRegular(
                                          size: size.height * 13 / 812)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 34 / 375,
                                  right: size.width * 33 / 375,
                                  bottom: size.height * 16 / 812),
                              child: Row(
                                children: [
                                  Text(LocaleKeys.sessionType.tr(),
                                      style: Fonts.fBold(
                                          size: size.height * 14 / 812)),
                                  SizedBox(
                                    width: size.width * 6 / 375,
                                  ),
                                  getSingleReport!.data!.sessionDetails == null
                                      ?  Center(
                                          child: Text(
                                              LocaleKeys.notExist.tr()),
                                        )
                                      : Text(
                                          getSingleReport!.data!.sessionDetails!
                                                      .isReview ==
                                                  1
                                              ? LocaleKeys.review.tr()
                                              : LocaleKeys.newAppointment.tr(),
                                          style: Fonts.fRegular(
                                              size: size.height * 13 / 812)),
                                ],
                              ),
                            ),
                            Container(
                              color: dividerColor,
                              height: size.height * 10 / 812,
                            ),
                            getSingleReport!.data!.doctorDetails == null
                                ? Center(
                                    child: Text(LocaleKeys.notExist.tr()),
                                  )
                                : PersonDetails(
                                    name: getSingleReport!
                                            .data!.doctorDetails!.name ??
                                        LocaleKeys.notExist.tr(),
                                    clinicName: getSingleReport!
                                            .data!.doctorDetails!.clinicName ??
                                        '',
                                    phoneNum: getSingleReport!
                                                .data!.doctorDetails!.phones ==
                                            null
                                        ? LocaleKeys.notExist.tr()
                                        : getSingleReport!
                                            .data!.doctorDetails!.phones![0],
                                    title: LocaleKeys.doctorDetails.tr(),
                                    roleName: 'doctor',
                                  ),
                            Container(
                              color: dividerColor,
                              height: size.height * 10 / 812,
                            ),
                            getSingleReport!.data!.patientDetails == null
                                ? Center(
                                    child: Text(LocaleKeys.notExist.tr()),
                                  )
                                : PersonDetails(
                                    name: getSingleReport!
                                            .data!.patientDetails!.name ??
                                        LocaleKeys.notExist.tr(),
                                    phoneNum: getSingleReport!
                                            .data!.patientDetails!.phones ??
                                        LocaleKeys.notExist.tr(),
                                    title: LocaleKeys.patientDetails.tr(),
                                    roleName: 'patient',
                                  ),
                            Container(
                              color: dividerColor,
                              height: size.height * 10 / 812,
                            ),
                            getSingleReport!.data!.prescriptionDetails == null
                                ? Center(
                                    child: Text(LocaleKeys.notExist.tr()),
                                  )
                                : CustomPrescriptionDetails(
                                    title: getSingleReport!
                                            .data!.prescriptionDetails!.title ??
                                        LocaleKeys.notExist.tr(),
                                    description: getSingleReport!.data!
                                            .prescriptionDetails!.description ??
                                        LocaleKeys.notExist.tr(),
                                    dataOfMedTable: [
                                          [
                                            getSingleReport!.data!
                                                    .medications![0].name ??
                                                '',
                                            getSingleReport!
                                                    .data!
                                                    .medications![0]
                                                    .numberOfCans ??
                                                0,
                                            getSingleReport!
                                                    .data!
                                                    .medications![0]
                                                    .numberOfDoses ??
                                                0,
                                            getSingleReport!
                                                    .data!
                                                    .medications![0]
                                                    .doseDescription ??
                                                ''
                                          ]
                                        ] ??
                                        [],
                                    dataOfMedicalTable: []),
                            Container(
                              color: dividerColor,
                              height: size.height * 10 / 812,
                            ),
                            getSingleReport!.data!.invoiceDetails == null
                                ? Center(
                                    child: Text(LocaleKeys.notExist.tr()),
                                  )
                                : CustomInvoiceDetails(
                                    status: getSingleReport!
                                        .data!.invoiceDetails!.isPaid!,
                                    total: getSingleReport!
                                        .data!.invoiceDetails!.totalPrice!,
                                    dataOfInvTable: getSingleReport!.data!
                                            .invoiceDetails!.invoiceTable ??
                                        []),
                            SvgPicture.asset(
                              'assets/Logo.svg',
                              color: lightGrey,
                              height: size.height * 204.8 / 812,
                              width: size.width * 400.24 / 375,
                            ),
                          ],
                        ),
                      ),
          );
        },
      ),
    );
  }
}
