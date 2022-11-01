import 'package:departments/models/certificates/get_certificates_by_id.dart';
import 'package:departments/models/doctor/get_doctor_by_id.dart';
import 'package:departments/models/working%20times/get_working_times_by_id.dart';
import 'package:departments/models/doctor/set_rating_doctor_by_id.dart';
import 'package:departments/models/error%20model/error_model.dart';

abstract class SingleDoctorState {}

class SingleDoctorInitialState extends SingleDoctorState {}

class SingleDoctorChangeState extends SingleDoctorState {}

class SingleDoctorGetSingleDoctorSuccessState extends SingleDoctorState {
  final GetDoctorById getDoctorById;

  SingleDoctorGetSingleDoctorSuccessState(this.getDoctorById);
}

class SingleDoctorGetSingleDoctorErrorState extends SingleDoctorState {
  final ErrorModel errorModel;

  SingleDoctorGetSingleDoctorErrorState(this.errorModel);
}

class SingleDoctorGetSingleDoctorLoadingState extends SingleDoctorState {}

class SingleDoctorChangeComplementSuccessState extends SingleDoctorState {}

class SingleDoctorChangeRatingSuccessState extends SingleDoctorState {}

class SingleDoctorSetRatingDoctorSuccessState extends SingleDoctorState {
  final SetRatingDoctorById setRatingDoctorById;

  SingleDoctorSetRatingDoctorSuccessState(this.setRatingDoctorById);
}

class SingleDoctorSetRatingDoctorErrorState extends SingleDoctorState {
  final ErrorModel errorModel;

  SingleDoctorSetRatingDoctorErrorState(this.errorModel);
}

class SingleDoctorSetRatingDoctorLoadingState extends SingleDoctorState {}

class SingleDoctorGetCertificatesDoctorSuccessState extends SingleDoctorState {
  final GetCertificatesById getCertificatesById;

  SingleDoctorGetCertificatesDoctorSuccessState(this.getCertificatesById);
}

class SingleDoctorGetCertificatesDoctorErrorState extends SingleDoctorState {
  final ErrorModel errorModel;

  SingleDoctorGetCertificatesDoctorErrorState(this.errorModel);
}

class SingleDoctorGetCertificatesDoctorLoadingState extends SingleDoctorState {}

class SingleDoctorGetWorkingTimesDoctorSuccessState extends SingleDoctorState {
  final GetWorkingTimesById getWorkingTimesById;

  SingleDoctorGetWorkingTimesDoctorSuccessState(this.getWorkingTimesById);
}

class SingleDoctorGetWorkingTimesDoctorErrorState extends SingleDoctorState {
  final ErrorModel errorModel;

  SingleDoctorGetWorkingTimesDoctorErrorState(this.errorModel);
}

class SingleDoctorGetWorkingTimesDoctorLoadingState extends SingleDoctorState {}
