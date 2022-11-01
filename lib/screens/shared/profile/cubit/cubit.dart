import 'package:bloc/bloc.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/profile/get_doctor_profile.dart';
import 'package:departments/models/profile/get_general_profile.dart';
import 'package:departments/models/profile/get_patient_profile.dart';
import 'package:departments/screens/shared/profile/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  void profile() {
    if (role == 'Patient') {
      getGeneralProfile();
      getPatientProfile();
    } else if (role == 'Doctor') {
      getGeneralProfile();
      getDoctorProfile();
    }
  }

  void getGeneralProfile() {
    emit(ProfileGetGeneralProfileLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getGeneralProfileUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetGeneralProfile getGeneralProfile;
        getGeneralProfile = GetGeneralProfile.fromJson(response.data);
        emit(ProfileGetGeneralProfileSuccessState(getGeneralProfile));
      } else if (response.statusCode! < 500 && response.statusCode! >= 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(ProfileGetGeneralProfileErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void getPatientProfile() {
    emit(ProfileGetPatientProfileLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getPatientProfileUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetPatientProfile getPatientProfile;
        getPatientProfile = GetPatientProfile.fromJson(response.data);
        emit(ProfileGetPatientProfileSuccessState(getPatientProfile));
      } else if (response.statusCode! < 500 && response.statusCode! >= 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(ProfileGetPatientProfileErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void getDoctorProfile() {
    emit(ProfileGetDoctorProfileLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getDoctorProfileUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetDoctorProfile getDoctorProfile;
        getDoctorProfile = GetDoctorProfile.fromJson(response.data);
        emit(ProfileGetDoctorProfileSuccessState(getDoctorProfile));
      } else if (response.statusCode! < 500 && response.statusCode! >= 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(ProfileGetDoctorProfileErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  static int gender = 0;
  static String firstName = '';
  static String fatherName = '';
  static String lastName = '';
  static late List<String> contactNumbers;
  static dynamic emailAddress;
  static String birthDate = '';
  static int heightPerson = 0;
  static int weightPerson = 0;

  late var firstNameController = TextEditingController(text: firstName);
  late var fatherNameController = TextEditingController(text: fatherName);
  late var lastNameController = TextEditingController(text: lastName);
  late var numbersControllers = List.generate(contactNumbers.length,
      (index) => TextEditingController(text: contactNumbers[index]));
  late var emailAddressController = TextEditingController(text: emailAddress);
  late var birthDateController = TextEditingController(text: birthDate);
  late var heightController = TextEditingController(text: '$heightPerson');
  late var weightController = TextEditingController(text: '$weightPerson');
}
