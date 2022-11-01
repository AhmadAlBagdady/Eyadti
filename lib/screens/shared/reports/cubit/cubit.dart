import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/reports/get_doctor_reports.dart';
import 'package:departments/models/reports/get_patient_reports.dart';
import 'package:departments/models/reports/get_single_report.dart';
import 'package:departments/screens/shared/reports/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(ReportsInitialState());
  static ReportsCubit get(context) => BlocProvider.of(context);

  void getReports() {
    if (role == 'Patient') {
      getPatientReports();
    } else if (role == 'Doctor') {
      getDoctorReports();
    }
  }

  void getPatientReports() {
    emit(ReportsGetPatientReportsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getPatientReportsUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetPatientReports getPatientReports;
        getPatientReports = GetPatientReports.fromJson(response.data);
        emit(ReportsGetPatientReportsSuccessState(getPatientReports));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(ReportsGetPatientReportsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }

  void getDoctorReports() {
    emit(ReportsGetDoctorReportsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getDoctorReportsUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetDoctorReports getDoctorReports;
        getDoctorReports = GetDoctorReports.fromJson(response.data);
        emit(ReportsGetDoctorReportsSuccessState(getDoctorReports));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(ReportsGetDoctorReportsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
