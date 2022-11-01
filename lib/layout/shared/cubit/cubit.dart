import 'package:departments/layout/shared/cubit/state.dart';
import 'package:departments/models/auth/logout_model.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/screens/doctor/doctor%20clinic/doctor_clinic.dart';
import 'package:departments/screens/shared/appoitments/appointments.dart';
import 'package:departments/screens/shared/departments/departments.dart';
import 'package:departments/screens/shared/home/home_page.dart';
import 'package:departments/screens/shared/patients/patients.dart';
import 'package:departments/screens/shared/reports/reports.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitialMainState());

  static MainCubit get(context) => BlocProvider.of(context);
  final GlobalKey<ScaffoldState> layoutKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  List<Widget> patientBottomNavScreen = [
    HomePage(),
    Appointments(),
    Reports(),
    Departments(),
  ];

  List<Widget> doctorBottomNavScreen = [
    HomePage(),
    Appointments(),
    Patients(),
    Reports(),
    DoctorClinic(),
  ];

  static bool? isBlogActive;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBar());
  }

  Future<void> logout(BuildContext context) async {
    DioHelper dioHelper = DioHelper();
    dioHelper.postData(url: logoutUrl, data: {}, token: token).then((response) {
      if (response.statusCode! < 300) {
        late LogoutModel logoutModel;
        logoutModel = LogoutModel.fromJson(response.data);
        emit(HomeLogoutSuccessState(logoutModel));
        removeData(context).then((value) {
          showToast(msg: logoutModel.message!, color: green);
        });
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(HomeLogoutErrorState(errorModel));
        showToast(msg: errorModel.message!, color: red);
      }
    });
  }
}
