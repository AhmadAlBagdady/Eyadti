import 'package:departments/models/appointments/delete_appointment.dart';
import 'package:departments/models/appointments/get_doctor_appointmets.dart';
import 'package:departments/models/appointments/get_patient_appointments.dart';
import 'package:departments/screens/shared/appoitments/cubit/cubit.dart';
import 'package:departments/screens/shared/appoitments/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/custom_alert_dialog.dart';
import 'package:departments/shared/widgets/custom_app_bar.dart';
import 'package:departments/shared/widgets/appointment_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Appointments extends StatelessWidget {
  Appointments({Key? key}) : super(key: key);

  GetPatientAppointments? getPatientAppointments;
  GetDoctorAppointments? getDoctorAppointments;
  DeleteAppointment? deleteAppointment;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentsCubit()..getAppointments(),
      child: BlocConsumer<AppointmentsCubit, AppointmentsState>(
          listener: (context, state) {
        if (state is AppointmentsGetPatientAppointmentsSuccessState) {
          getPatientAppointments = state.getPatientAppointments;
        } else if (state is AppointmentsGetPatientAppointmentsErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
        if (state is AppointmentsGetDoctorAppointmentsSuccessState) {
          getDoctorAppointments = state.getDoctorAppointments;
        } else if (state is AppointmentsGetDoctorAppointmentsErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }

        if (state is AppointmentsDeleteAppointmentSuccessState) {
          showToast(msg: state.deleteAppointment.message!, color: green);
          deleteAppointment = state.deleteAppointment;
        } else if (state is AppointmentsDeleteAppointmentErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
      }, builder: (context, state) {
        AppointmentsCubit appointmentsCubit = AppointmentsCubit.get(context);
        return Scaffold(
          backgroundColor: white,
          appBar: CustomAppBar(title: LocaleKeys.myAppointments.tr()),
          body: role == 'Patient'
              ? state is AppointmentsGetPatientAppointmentsLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : getPatientAppointments!.data == null
                      ? Center(
                          child: Text(
                            getPatientAppointments!.message!,
                            style: Fonts.fBold(
                                size: size.height * 20 / 812, color: grey),
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            appointmentsCubit.getPatientAppointments();
                          },
                          child: SizedBox(
                              width: size.width,
                              height: size.height,
                              child: ListView.separated(
                                  padding:
                                      EdgeInsets.only(bottom: size.height / 10),
                                  separatorBuilder: (context, index) =>
                                      state is AppointmentsGetPatientAppointmentsSuccessState &&
                                              appointmentsCubit
                                                  .thisCardBe[index]
                                          ? Container(
                                              color: dividerColor,
                                              height: size.height / 81.2,
                                            )
                                          : Container(),
                                  itemBuilder: (context, index) =>
                                      state is AppointmentsGetPatientAppointmentsSuccessState &&
                                              state.thisCardBe[index] == true
                                          ? AppointmentCard(
                                              id: getPatientAppointments!
                                                  .data![index].id!,
                                              date: DateTime.parse(
                                                  getPatientAppointments!
                                                      .data![index].date!),
                                              name: getPatientAppointments!
                                                  .data![index].doctorName!,
                                              time: getPatientAppointments!
                                                  .data![index].time!,
                                              status: getPatientAppointments!
                                                  .data![index].statue!,
                                              onPressed: () {
                                                if (getPatientAppointments!
                                                    .data![index].canCancel!) {
                                                  appointmentsCubit
                                                      .deleteAppointment(
                                                          id: getPatientAppointments!
                                                              .data![index]
                                                              .id!);
                                                  state.thisCardBe[index] =
                                                      false;
                                                } else {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          CustomAlertDialog(
                                                            msg:
                                                                'Do you want to delete this appointment',
                                                            stateNo: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            stateYes: () {
                                                              appointmentsCubit
                                                                  .changeThisCardBe(
                                                                      index);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ));
                                                }
                                              },
                                              canCancel: getPatientAppointments!
                                                  .data![index].canCancel!,
                                            )
                                          : Container(),
                                  itemCount:
                                      getPatientAppointments!.data!.length)),
                        )
              : state is AppointmentsGetDoctorAppointmentsLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : getDoctorAppointments!.data == null
                      ? Center(
                          child: Text(
                            getDoctorAppointments!.message!,
                            style: Fonts.fBold(
                                size: size.height * 20 / 812, color: grey),
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            appointmentsCubit.getDoctorAppointments();
                          },
                          child: SizedBox(
                            width: size.width,
                            height: size.height,
                            child: ListView.separated(
                                padding:
                                    EdgeInsets.only(bottom: size.height / 10),
                                separatorBuilder: (context, index) => Container(
                                      color: dividerColor,
                                      height: size.height / 81.2,
                                    ),
                                itemBuilder: (context, index) => state
                                        is AppointmentsGetDoctorAppointmentsSuccessState
                                    ? AppointmentCard(
                                        id: getDoctorAppointments!
                                            .data![index].id!,
                                        date: DateTime.parse(
                                            getDoctorAppointments!
                                                .data![index].date!),
                                        name: getDoctorAppointments!
                                            .data![index].patientName!,
                                        time: getDoctorAppointments!
                                            .data![index].time!,
                                        status: getDoctorAppointments!
                                            .data![index].statue!,
                                        onPressed: () {},
                                        canCancel: false,
                                      )
                                    : Container(),
                                itemCount: getDoctorAppointments!.data!.length),
                          ),
                        ),
        );
      }),
    );
  }
}
