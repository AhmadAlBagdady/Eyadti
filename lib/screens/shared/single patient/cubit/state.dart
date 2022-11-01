import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/patient/get_single_patient.dart';

abstract class SinglePatientState {}

class SinglePatientInitialState extends SinglePatientState {}

class SinglePatientGetSinglePatientSuccessState extends SinglePatientState {
  final GetSinglePatient getSinglePatient;
  SinglePatientGetSinglePatientSuccessState(this.getSinglePatient);
}

class SinglePatientGetSinglePatientErrorState extends SinglePatientState {
  final ErrorModel errorModel;
  SinglePatientGetSinglePatientErrorState(this.errorModel);
}

class SinglePatientGetSinglePatientLoadingState extends SinglePatientState {}
