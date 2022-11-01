import 'package:departments/models/clinic/get_my_clinic.dart';
import 'package:departments/models/error%20model/error_model.dart';

abstract class DoctorClinicState {}

class DoctorClinicInitialState extends DoctorClinicState {}

class DoctorClinicChangeState extends DoctorClinicState {}

class DoctorClinicGetMyClinicSuccessState extends DoctorClinicState {
  final GetMyClinic getMyClinic;
  DoctorClinicGetMyClinicSuccessState(this.getMyClinic);
}

class DoctorClinicGetMyClinicErrorState extends DoctorClinicState {
  final ErrorModel errorModel;
  DoctorClinicGetMyClinicErrorState(this.errorModel);
}

class DoctorClinicGetMyClinicLoadingState extends DoctorClinicState {}
