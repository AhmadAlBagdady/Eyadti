import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/patient/get_single_patient.dart';
import 'package:departments/screens/shared/single%20patient/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SinglePatientCubit extends Cubit<SinglePatientState> {
  SinglePatientCubit() : super(SinglePatientInitialState());

  static SinglePatientCubit get(context) => BlocProvider.of(context);

  bool isGeneralInfo = true;
  bool isHealthyInfo = true;

  DateTime? selectedDate;
  var birthDate = TextEditingController();

  void changeSecure(String isSecure) {
    if (isSecure == 'isGeneralInfo') isGeneralInfo = !isGeneralInfo;
    if (isSecure == 'isHealthyInfo') isHealthyInfo = !isHealthyInfo;
    emit(SinglePatientInitialState());
  }

  void getSinglePatient({required int id}) {
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getSinglePatientUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetSinglePatient getSinglePatient;
        getSinglePatient = GetSinglePatient.fromJson(response.data);
        emit(SinglePatientGetSinglePatientSuccessState(getSinglePatient));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SinglePatientGetSinglePatientErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }
}
