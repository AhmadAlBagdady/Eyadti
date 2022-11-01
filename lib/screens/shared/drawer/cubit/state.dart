import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/settings/send_report.dart';

abstract class DrawerState {}

class DrawerInitialState extends DrawerState {}

class DrawerSendReportSuccessState extends DrawerState {
  final SendReport sendReport;

  DrawerSendReportSuccessState(this.sendReport);
}

class DrawerSendReportErrorState extends DrawerState {
  final ErrorModel errorModel;

  DrawerSendReportErrorState(this.errorModel);
}

class DrawerSendReportLoadingState extends DrawerState {}
