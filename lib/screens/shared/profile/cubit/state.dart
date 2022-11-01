import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/profile/get_doctor_profile.dart';
import 'package:departments/models/profile/get_general_profile.dart';
import 'package:departments/models/profile/get_patient_profile.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileChangeSelectedItem extends ProfileState {}

class ProfileGetGeneralProfileSuccessState extends ProfileState {
  final GetGeneralProfile getGeneralProfile;

  ProfileGetGeneralProfileSuccessState(this.getGeneralProfile);
}

class ProfileGetGeneralProfileErrorState extends ProfileState {
  final ErrorModel errorModel;

  ProfileGetGeneralProfileErrorState(this.errorModel);
}

class ProfileGetGeneralProfileLoadingState extends ProfileState {}

class ProfileGetPatientProfileSuccessState extends ProfileState {
  final GetPatientProfile getPatientProfile;

  ProfileGetPatientProfileSuccessState(this.getPatientProfile);
}

class ProfileGetPatientProfileErrorState extends ProfileState {
  final ErrorModel errorModel;

  ProfileGetPatientProfileErrorState(this.errorModel);
}

class ProfileGetPatientProfileLoadingState extends ProfileState {}

class ProfileGetDoctorProfileSuccessState extends ProfileState {
  final GetDoctorProfile getDoctorProfile;

  ProfileGetDoctorProfileSuccessState(this.getDoctorProfile);
}

class ProfileGetDoctorProfileErrorState extends ProfileState {
  final ErrorModel errorModel;

  ProfileGetDoctorProfileErrorState(this.errorModel);
}

class ProfileGetDoctorProfileLoadingState extends ProfileState {}
