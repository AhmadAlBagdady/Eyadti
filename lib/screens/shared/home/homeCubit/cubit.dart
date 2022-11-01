import 'package:departments/models/appointments/get_calender.dart';
import 'package:departments/models/complaints/get_last_complaint.dart';
import 'package:departments/models/department/get_all_departments.dart';
import 'package:departments/models/doctor/get_all_doctors.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/get_last_post.dart';
import 'package:departments/models/news/is_blog_active.dart';
import 'package:departments/models/notifications/is_there_notifications.dart';
import 'package:departments/models/patient/get_last_patient.dart';
import 'package:departments/screens/shared/home/homeCubit/states.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialStates());

  static HomeCubit get(context) => BlocProvider.of(context);
  void home() {
    emit(HomeLoadingStates());
    isThereNotifications();
    isBlogActive().then((value) {
      isActive! ? getLastPost() : null;
    });
    if (role == 'Patient') {
      print(token);
      getCalender();
      getDoctors();
      getDepartments();
    }
    if (role == 'Doctor') {
      print(token);
      getCalender();
      getLastComplaint();
      getLastPatient();
    }
  }

  // is blog active or not
  bool? isActive = true;

  bool searchVisible = false;

  void changeSearchVisible(bool visible) {
    if (visible != searchVisible) {
      searchVisible = visible;
      emit(HomeSearchVisibleStates());
    }
  }

  void getDoctors() {
    emit(HomeGetDoctorsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getAllDoctorUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetAllDoctors allDoctors;
        allDoctors = GetAllDoctors.fromJson(response.data);
        emit(HomeGetDoctorsSuccessState(allDoctors, response.statusCode!));
      } else if (response.statusCode! < 500 && response.statusCode! >= 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(HomeGetDoctorsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void getCalender() {
    emit(HomeGetCalenderLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .getData(
            url: role == 'Patient'
                ? getCalenderPatientUrl
                : getCalenderDoctorUrl,
            token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetCalender getCalender;
        getCalender = GetCalender.fromJson(response.data);
        emit(HomeGetCalenderSuccessState(getCalender));
      } else if (response.statusCode! < 500 && response.statusCode! >= 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(HomeGetCalenderErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  Future<void> isBlogActive() async {
    emit(HomeIsBlogActiveLoadingState());
    DioHelper dioHelper = DioHelper();
    await dioHelper
        .getData(url: isBlogActiveUrl, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late IsBlogActive isBlogActive;
        isBlogActive = IsBlogActive.fromJson(response.data);
        isActive = isBlogActive.data!;
        emit(HomeIsBlogActiveSuccessState(isBlogActive));
      } else if (response.statusCode! < 500 && response.statusCode! >= 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(HomeIsBlogActiveErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void getDepartments() {
    emit(HomeGetDepartmentsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getAllDepartmentsUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetDepartments allDepartments;
        allDepartments = GetDepartments.fromJson(response.data);
        emit(HomeGetDepartmentsSuccessState(
            allDepartments, response.statusCode!));
      } else if (response.statusCode! < 500 && response.statusCode! >= 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(HomeGetDepartmentsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void getLastPost() {
    emit(HomeGetLastPostLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getLastPostUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetLastPost getLastPost;
        getLastPost = GetLastPost.fromJson(response.data);
        emit(HomeGetLastPostSuccessState(getLastPost, response.statusCode!));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(HomeGetLastPostErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void isThereNotifications() {
    DioHelper dioHelper = DioHelper();
    dioHelper
        .getData(url: isThereNotificationsUrl, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late IsThereNotifications isThereNotifications;
        isThereNotifications = IsThereNotifications.fromJson(response.data);
        emit(HomeIsThereNotificationsSuccessState(isThereNotifications));
      } else if (response.statusCode! < 500 && response.statusCode! >= 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(HomeIsThereNotificationsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void getLastComplaint() {
    emit(HomeGetLastComplaintLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getLastComplaintUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetLastComplaint getLastComplaint;
        getLastComplaint = GetLastComplaint.fromJson(response.data);
        emit(HomeGetLastComplaintSuccessState(getLastComplaint));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(HomeGetLastComplaintErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void getLastPatient() {
    emit(HomeGetLastPatientLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getLastPatientUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetLastPatient getLastPatient;
        getLastPatient = GetLastPatient.fromJson(response.data);
        emit(HomeGetLastPatientSuccessState(getLastPatient));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(HomeGetLastPatientErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }
}
