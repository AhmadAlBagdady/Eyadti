import 'dart:async';

import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/models/department/get_all_departments.dart';
import 'package:departments/models/department/search_departments.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/screens/shared/departments/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentsCubit extends Cubit<DepartmentsState> {
  DepartmentsCubit() : super(DepartmentsInitialState());

  static DepartmentsCubit get(context) => BlocProvider.of(context);
  static String departmentsSearch = '';

  void getAll() {
    emit(DepartmentsGetAllLoadingState());
    DioHelper dioHelper = DioHelper();
    late GetDepartments getAllDepartments;
    List<GetClinicsById> getList = [];
    late GetClinicsById g;
    dioHelper.getData(url: getAllDepartmentsUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        getAllDepartments = GetDepartments.fromJson(response.data);
        emit(DepartmentsGetAllDepartmentsSuccessState(
            getAllDepartments, response.statusCode!));
      }
      if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(DepartmentsGetAllErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    }).then((response) async {
      if (state is DepartmentsGetAllDepartmentsSuccessState) {
        for (int i = 0; i < getAllDepartments.data!.length; i++) {
          await dioHelper
              .postData(
                  url: getClinicsByIdUrl,
                  data: {'id': getAllDepartments.data![i].id},
                  token: token)
              .then((response) {
            if (response.statusCode! < 300) {
              g = GetClinicsById.fromJson(response.data);
              getList.add(g);
            }
          }).then((value) {
            if (i == getAllDepartments.data!.length - 1) {
              emit(DepartmentsGetAllSuccessState(
                  getList, getAllDepartments, 200));
            }
          });
        }
      }
    });
  }

  void getClinicsById(int id) {
    emit(DepartmentsGetClinicsByIdLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getClinicsByIdUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetClinicsById getClinicsById;
        getClinicsById = GetClinicsById.fromJson(response.data);
        emit(DepartmentsGetClinicsByIdSuccessState(
            getClinicsById, response.statusCode!));
      }
      if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(DepartmentsGetClinicsByIdErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }
}
