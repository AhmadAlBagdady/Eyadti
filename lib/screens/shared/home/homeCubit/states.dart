import 'package:departments/models/appointments/get_calender.dart';
import 'package:departments/models/auth/logout_model.dart';
import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/models/complaints/get_last_complaint.dart';
import 'package:departments/models/department/get_all_departments.dart';
import 'package:departments/models/doctor/get_all_doctors.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/get_last_post.dart';
import 'package:departments/models/news/is_blog_active.dart';
import 'package:departments/models/notifications/is_there_notifications.dart';
import 'package:departments/models/patient/get_last_patient.dart';
import 'package:dio/dio.dart';

abstract class HomeStates {}

class HomeInitialStates extends HomeStates {}

class HomeLoadingStates extends HomeStates {}

class HomeSearchVisibleStates extends HomeStates {}

class HomeGetDoctorsSuccessState extends HomeStates {
  final GetAllDoctors getAllDoctors;
  final int statusCode;
  HomeGetDoctorsSuccessState(this.getAllDoctors, this.statusCode);
}

class HomeGetDoctorsErrorState extends HomeStates {
  final ErrorModel errorModel;
  HomeGetDoctorsErrorState(this.errorModel);
}

class HomeGetDoctorsLoadingState extends HomeStates {}

class HomeGetDepartmentsSuccessState extends HomeStates {
  final GetDepartments getAllDepartments;
  final int statusCode;
  HomeGetDepartmentsSuccessState(this.getAllDepartments, this.statusCode);
}

class HomeGetDepartmentsErrorState extends HomeStates {
  final ErrorModel errorModel;
  HomeGetDepartmentsErrorState(this.errorModel);
}

class HomeGetDepartmentsLoadingState extends HomeStates {}

class HomeGetLastPostSuccessState extends HomeStates {
  final GetLastPost getLastPost;
  final int statusCode;
  HomeGetLastPostSuccessState(this.getLastPost, this.statusCode);
}

class HomeGetLastPostErrorState extends HomeStates {
  final ErrorModel errorModel;

  HomeGetLastPostErrorState(this.errorModel);
}

class HomeGetLastPostLoadingState extends HomeStates {}

class HomeIsThereNotificationsSuccessState extends HomeStates {
  final IsThereNotifications isThereNotifications;
  HomeIsThereNotificationsSuccessState(this.isThereNotifications);
}

class HomeIsThereNotificationsErrorState extends HomeStates {
  final ErrorModel errorModel;
  HomeIsThereNotificationsErrorState(this.errorModel);
}

class HomeGetClinicByIdSuccessState extends HomeStates {
  final GetClinicsById getClinicsById;
  final int statusCode;
  HomeGetClinicByIdSuccessState(this.getClinicsById, this.statusCode);
}

class HomeGetClinicByIdErrorState extends HomeStates {}

class HomeGetClinicByIdLoadingState extends HomeStates {}

class HomeIsBlogActiveLoadingState extends HomeStates {}

class HomeIsBlogActiveErrorState extends HomeStates {
  final ErrorModel errorModel;

  HomeIsBlogActiveErrorState(this.errorModel);
}

class HomeIsBlogActiveSuccessState extends HomeStates {
  final IsBlogActive isBlogActive;
  HomeIsBlogActiveSuccessState(this.isBlogActive);
}

class HomeGetCalenderSuccessState extends HomeStates {
  final GetCalender getCalender;
  HomeGetCalenderSuccessState(this.getCalender);
}

class HomeGetCalenderErrorState extends HomeStates {
  final ErrorModel errorModel;
  HomeGetCalenderErrorState(this.errorModel);
}

class HomeGetCalenderLoadingState extends HomeStates {}

class HomeGetLastComplaintSuccessState extends HomeStates {
  final GetLastComplaint getLastComplaint;
  HomeGetLastComplaintSuccessState(this.getLastComplaint);
}

class HomeGetLastComplaintErrorState extends HomeStates {
  final ErrorModel errorModel;
  HomeGetLastComplaintErrorState(this.errorModel);
}

class HomeGetLastComplaintLoadingState extends HomeStates {}

class HomeGetLastPatientSuccessState extends HomeStates {
  final GetLastPatient getLastPatient;
  HomeGetLastPatientSuccessState(this.getLastPatient);
}

class HomeGetLastPatientErrorState extends HomeStates {
  final ErrorModel errorModel;
  HomeGetLastPatientErrorState(this.errorModel);
}

class HomeGetLastPatientLoadingState extends HomeStates {}
