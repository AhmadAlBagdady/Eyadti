import 'package:departments/models/clinic/get_single_clinic.dart';
import 'package:departments/models/error%20model/error_model.dart';

abstract class SingleClinicState{}
class SingleClinicInitialState extends SingleClinicState {}

class SingleClinicSuccessState extends SingleClinicState {
  final GetSingleClinic getSingleClinic;
  SingleClinicSuccessState(this.getSingleClinic);
}
class SingleClinicErrorState extends SingleClinicState {
  final ErrorModel errorModel;
  SingleClinicErrorState(this.errorModel);
}
class SingleClinicLoadingState extends SingleClinicState {}