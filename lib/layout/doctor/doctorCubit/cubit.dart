import 'package:bloc/bloc.dart';
import 'package:departments/layout/doctor/doctorCubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorCubit extends Cubit<DoctorStates> {
  DoctorCubit() : super(DoctorInitialStates());

  static DoctorCubit get(context) => BlocProvider.of(context);
  final GlobalKey<ScaffoldState> layoutKey = GlobalKey<ScaffoldState>();
}
