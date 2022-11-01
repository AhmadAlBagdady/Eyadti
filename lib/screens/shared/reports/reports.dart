import 'package:departments/models/reports/get_doctor_reports.dart';
import 'package:departments/models/reports/get_patient_reports.dart';
import 'package:departments/screens/patient/single%20report/single_report.dart';
import 'package:departments/screens/shared/reports/cubit/cubit.dart';
import 'package:departments/screens/shared/reports/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/custom_app_bar.dart';
import 'package:departments/shared/widgets/report_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Reports extends StatelessWidget {
  Reports({Key? key}) : super(key: key);

  GetPatientReports? getPatientReports;
  GetDoctorReports? getDoctorReports;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportsCubit()..getReports(),
      child: BlocConsumer<ReportsCubit, ReportsState>(
        listener: (context, state) {
          if (state is ReportsGetPatientReportsSuccessState) {
            getPatientReports = state.getPatientReports;
          } else if (state is ReportsGetPatientReportsErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }

          if (state is ReportsGetDoctorReportsSuccessState) {
            getDoctorReports = state.getDoctorReports;
          } else if (state is ReportsGetDoctorReportsErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: white,
            appBar: CustomAppBar(title: LocaleKeys.myReports.tr()),
            body: role == 'Patient'
                ? state is ReportsGetPatientReportsLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : getPatientReports!.data == null
                        ? Center(
                            child: Text(
                              getPatientReports!.message!,
                              style: Fonts.fBold(
                                  size: size.height * 20 / 812, color: grey),
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: () async {
                              ReportsCubit.get(context).getPatientReports();
                            },
                            child: Container(
                              width: size.width,
                              height: size.height,
                              child: ListView.separated(
                                  padding:
                                      EdgeInsets.only(bottom: size.height / 10),
                                  separatorBuilder: (context, index) =>
                                      Container(
                                        color: dividerColor,
                                        height: size.height / 81.2,
                                      ),
                                  itemBuilder: (context, index) => InkWell(
                                      onTap: () {

                                      },
                                      child: ReportCard(
                                        date: DateTime.parse(getPatientReports!
                                            .data![index].date!),
                                        doctorName: getPatientReports!
                                            .data![index].doctorName!,
                                        time: getPatientReports!
                                            .data![index].time!,
                                        status: getPatientReports!
                                            .data![index].statue!,
                                      )),
                                  itemCount: getPatientReports!.data!.length),
                            ),
                          )
                : state is ReportsGetDoctorReportsLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : getDoctorReports!.data == null
                        ? Center(
                            child: Text(
                              getDoctorReports!.message!,
                              style: Fonts.fBold(
                                  size: size.height * 20 / 812, color: grey),
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: () async {
                              ReportsCubit.get(context).getDoctorReports();
                            },
                            child: Container(
                              width: size.width,
                              height: size.height,
                              child: ListView.separated(
                                  padding:
                                      EdgeInsets.only(bottom: size.height / 10),
                                  separatorBuilder: (context, index) =>
                                      Container(
                                        color: dividerColor,
                                        height: size.height / 81.2,
                                      ),
                                  itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleReport(
                                                        id: getPatientReports!
                                                            .data![index].id!,
                                                        appointmentDate:
                                                            getPatientReports!
                                                                .data![index]
                                                                .date!)));
                                      },
                                      child: ReportCard(
                                        date: DateTime.parse(getDoctorReports!
                                            .data![index].date!),
                                        doctorName: getDoctorReports!
                                            .data![index].patientName!,
                                        time: getDoctorReports!
                                            .data![index].time!,
                                        status: getDoctorReports!
                                            .data![index].statue!,
                                      )),
                                  itemCount: getDoctorReports!.data!.length),
                            ),
                          ),
          );
        },
      ),
    );
  }
}
