import 'package:departments/models/certificates/get_certificates_by_id.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/nurse/get_single_nurse.dart';
import 'package:departments/models/working%20times/get_working_times_by_id.dart';

abstract class SingleNurseState {}

class SingleNurseInitialState extends SingleNurseState {}

class SingleNurseChangeState extends SingleNurseState {}

class SingleNurseGetSingleNurseSuccessState extends SingleNurseState {
  final GetSingleNurse getSingleNurse;
  SingleNurseGetSingleNurseSuccessState(this.getSingleNurse);
}

class SingleNurseGetSingleNurseErrorState extends SingleNurseState {
  final ErrorModel errorModel;
  SingleNurseGetSingleNurseErrorState(this.errorModel);
}

class SingleNurseGetSingleNurseLoadingState extends SingleNurseState {}

class SingleNurseGetCertificatesNurseSuccessState extends SingleNurseState {
  final GetCertificatesById getCertificatesById;

  SingleNurseGetCertificatesNurseSuccessState(this.getCertificatesById);
}

class SingleNurseGetCertificatesNurseErrorState extends SingleNurseState {
  final ErrorModel errorModel;

  SingleNurseGetCertificatesNurseErrorState(this.errorModel);
}

class SingleNurseGetCertificatesNurseLoadingState extends SingleNurseState {}

class SingleNurseGetWorkingTimesNurseSuccessState extends SingleNurseState {
  final GetWorkingTimesById getWorkingTimesById;

  SingleNurseGetWorkingTimesNurseSuccessState(this.getWorkingTimesById);
}

class SingleNurseGetWorkingTimesNurseErrorState extends SingleNurseState {
  final ErrorModel errorModel;

  SingleNurseGetWorkingTimesNurseErrorState(this.errorModel);
}

class SingleNurseGetWorkingTimesNurseLoadingState extends SingleNurseState {}
