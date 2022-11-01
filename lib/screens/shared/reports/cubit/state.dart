import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/reports/get_doctor_reports.dart';
import 'package:departments/models/reports/get_patient_reports.dart';
import 'package:departments/models/reports/get_single_report.dart';

abstract class ReportsState {}

class ReportsInitialState extends ReportsState {}

class ReportsGetPatientReportsSuccessState extends ReportsState {
  final GetPatientReports getPatientReports;
  ReportsGetPatientReportsSuccessState(this.getPatientReports);
}

class ReportsGetPatientReportsLoadingState extends ReportsState {}

class ReportsGetPatientReportsErrorState extends ReportsState {
  final ErrorModel errorModel;
  ReportsGetPatientReportsErrorState(this.errorModel);
}

class ReportsGetDoctorReportsSuccessState extends ReportsState {
  final GetDoctorReports getDoctorReports;
  ReportsGetDoctorReportsSuccessState(this.getDoctorReports);
}

class ReportsGetDoctorReportsLoadingState extends ReportsState {}

class ReportsGetDoctorReportsErrorState extends ReportsState {
  final ErrorModel errorModel;
  ReportsGetDoctorReportsErrorState(this.errorModel);
}
