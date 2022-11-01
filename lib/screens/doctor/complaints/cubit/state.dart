import 'package:departments/models/complaints/get_my_malfunctions.dart';
import 'package:departments/models/error%20model/error_model.dart';

abstract class ComplaintsState {}

class ComplaintsInitialState extends ComplaintsState {}

class ComplaintsGetMyMalfunctionsSuccessState extends ComplaintsState {
  final GetMyMalfunctions getMyMalfunctions;
  final List<bool> thisCardBe;
  ComplaintsGetMyMalfunctionsSuccessState(
      this.getMyMalfunctions, this.thisCardBe);
}

class ComplaintsGetMyMalfunctionsErrorState extends ComplaintsState {
  final ErrorModel errorModel;
  ComplaintsGetMyMalfunctionsErrorState(this.errorModel);
}

class ComplaintsGetMyMalfunctionsLoadingState extends ComplaintsState {}
