import 'package:departments/models/appointments/delete_appointment.dart';
import 'package:departments/models/appointments/get_doctor_appointmets.dart';
import 'package:departments/models/appointments/get_patient_appointments.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/screens/shared/appoitments/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit() : super(AppointmentsInitialState());

  static AppointmentsCubit get(context) => BlocProvider.of(context);

  void getAppointments() {
    if (role == 'Patient') {
      getPatientAppointments();
    } else if (role == 'Doctor') {
      getDoctorAppointments();
    }
  }

  List<bool> thisCardBe = [];
  void changeThisCardBe(int index) {
    thisCardBe[index] = false;
    emit(AppointmentsDeleteAppointmentsSuccessState());
  }

  void getPatientAppointments() {
    emit(AppointmentsGetPatientAppointmentsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .getData(url: getPatientAppointmentsUrl, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetPatientAppointments getPatientAppointments;
        getPatientAppointments = GetPatientAppointments.fromJson(response.data);
        thisCardBe = List.filled(
            getPatientAppointments.data == null
                ? 0
                : getPatientAppointments.data!.length,
            true);
        emit(AppointmentsGetPatientAppointmentsSuccessState(
            getPatientAppointments, thisCardBe));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(AppointmentsGetPatientAppointmentsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }

  void getDoctorAppointments() {
    emit(AppointmentsGetDoctorAppointmentsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .getData(url: getDoctorAppointmentsUrl, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetDoctorAppointments getDoctorAppointments;
        getDoctorAppointments = GetDoctorAppointments.fromJson(response.data);
        emit(AppointmentsGetDoctorAppointmentsSuccessState(
            getDoctorAppointments));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(AppointmentsGetDoctorAppointmentsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }

  void deleteAppointment({
    required int id,
  }) {
    emit(AppointmentsDeleteAppointmentLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: deleteAppointmentUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late DeleteAppointment deleteAppointment;
        deleteAppointment = DeleteAppointment.fromJson(response.data);
        emit(AppointmentsDeleteAppointmentSuccessState(deleteAppointment));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(AppointmentsDeleteAppointmentErrorState(errorModel));
      } else {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
