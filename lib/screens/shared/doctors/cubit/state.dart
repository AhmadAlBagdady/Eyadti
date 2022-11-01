import 'package:departments/layout/doctor/doctorCubit/state.dart';
import 'package:departments/models/doctor/get_all_doctors.dart';
import 'package:departments/models/error%20model/error_model.dart';

abstract class DoctorsState {}

class DoctorsInitialState extends DoctorsState {}

class DoctorsGetDoctorsSuccessState extends DoctorsState {
  final GetAllDoctors getAllDoctors;

  DoctorsGetDoctorsSuccessState(this.getAllDoctors);
}

class DoctorsGetDoctorsErrorState extends DoctorsState {
  final ErrorModel errorModel;

  DoctorsGetDoctorsErrorState(this.errorModel);
}

class DoctorsGetDoctorsLoadingState extends DoctorsState {}
