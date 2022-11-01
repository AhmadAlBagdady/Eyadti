import 'package:departments/layout/patient/patientCubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientCubit extends Cubit<PatientStates> {
  PatientCubit() : super(PatientInitialStates());

  static PatientCubit get(context) => BlocProvider.of(context);
}
