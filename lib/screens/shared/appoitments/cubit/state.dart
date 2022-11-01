import 'package:departments/models/appointments/delete_appointment.dart';
import 'package:departments/models/appointments/get_doctor_appointmets.dart';
import 'package:departments/models/appointments/get_patient_appointments.dart';
import 'package:departments/models/error%20model/error_model.dart';

abstract class AppointmentsState {}

class AppointmentsInitialState extends AppointmentsState {}

class AppointmentsGetPatientAppointmentsSuccessState extends AppointmentsState {
  final GetPatientAppointments getPatientAppointments;
  final List<bool> thisCardBe;
  AppointmentsGetPatientAppointmentsSuccessState(
      this.getPatientAppointments, this.thisCardBe);
}

class AppointmentsGetPatientAppointmentsLoadingState extends AppointmentsState {
}

class AppointmentsGetPatientAppointmentsErrorState extends AppointmentsState {
  final ErrorModel errorModel;
  AppointmentsGetPatientAppointmentsErrorState(this.errorModel);
}

class AppointmentsDeleteAppointmentSuccessState extends AppointmentsState {
  final DeleteAppointment deleteAppointment;
  AppointmentsDeleteAppointmentSuccessState(this.deleteAppointment);
}

class AppointmentsDeleteAppointmentLoadingState extends AppointmentsState {}

class AppointmentsDeleteAppointmentErrorState extends AppointmentsState {
  final ErrorModel errorModel;
  AppointmentsDeleteAppointmentErrorState(this.errorModel);
}

class AppointmentsGetDoctorAppointmentsSuccessState extends AppointmentsState {
  final GetDoctorAppointments getDoctorAppointments;
  AppointmentsGetDoctorAppointmentsSuccessState(this.getDoctorAppointments);
}

class AppointmentsGetDoctorAppointmentsLoadingState extends AppointmentsState {}

class AppointmentsGetDoctorAppointmentsErrorState extends AppointmentsState {
  final ErrorModel errorModel;
  AppointmentsGetDoctorAppointmentsErrorState(this.errorModel);
}

class AppointmentsDeleteAppointmentsSuccessState extends AppointmentsState {}
