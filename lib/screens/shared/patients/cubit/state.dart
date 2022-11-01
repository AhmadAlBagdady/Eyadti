import 'package:departments/models/doctor/get_my_patients.dart';
import 'package:departments/models/error%20model/error_model.dart';

abstract class PatientsState {}

class PatientsInitialState extends PatientsState {}

class PatientsGetMyPatientsSuccessState extends PatientsState {
  final GetMyPatients getMyPatients;
  PatientsGetMyPatientsSuccessState(this.getMyPatients);
}

class PatientsGetMyPatientsErrorState extends PatientsState {
  final ErrorModel errorModel;
  PatientsGetMyPatientsErrorState(this.errorModel);
}

class PatientsGetMyPatientsLoadingState extends PatientsState {}
