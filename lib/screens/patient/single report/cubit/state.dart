import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/reports/get_single_report.dart';

abstract class SingleReportState {}

class SingleReportInitialState extends SingleReportState {}

class SingleReportGetSingleReportSuccessState extends SingleReportState {
  final GetSingleReport getSingleReport;
  SingleReportGetSingleReportSuccessState(this.getSingleReport);
}

class SingleReportGetSingleReportLoadingState extends SingleReportState {}

class SingleReportGetSingleReportErrorState extends SingleReportState {
  final ErrorModel errorModel;
  SingleReportGetSingleReportErrorState(this.errorModel);
}
