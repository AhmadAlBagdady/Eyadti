import 'package:bloc/bloc.dart';
import 'package:departments/models/certificates/get_certificates_by_id.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/nurse/get_single_nurse.dart';
import 'package:departments/models/working%20times/get_working_times_by_id.dart';
import 'package:departments/screens/doctor/single%20nurse/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/constant/constant.dart';

class SingleNurseCubit extends Cubit<SingleNurseState> {
  SingleNurseCubit() : super(SingleNurseInitialState());

  static SingleNurseCubit get(context) => BlocProvider.of(context);

  bool isNurseArrowClicked = false;

  void changeShowingList() {
    isNurseArrowClicked = !isNurseArrowClicked;
    emit(SingleNurseChangeState());
  }

  void getSingleNurse({required int id}) {
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getSingleNurseUrl, data: {'nurse_id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetSingleNurse getNurseById;
        getNurseById = GetSingleNurse.fromJson(response.data);
        emit(SingleNurseGetSingleNurseSuccessState(getNurseById));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SingleNurseGetSingleNurseErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void getCertificatesNurse({required int id}) {
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getCertificatesNurseUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetCertificatesById getCertificatesById;
        getCertificatesById = GetCertificatesById.fromJson(response.data);
        emit(SingleNurseGetCertificatesNurseSuccessState(getCertificatesById));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SingleNurseGetCertificatesNurseErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void getWorkingTimesNurse({required int id}) {
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getWorkingTimesNurseUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetWorkingTimesById getWorkingTimesById;
        getWorkingTimesById = GetWorkingTimesById.fromJson(response.data);
        emit(SingleNurseGetWorkingTimesNurseSuccessState(getWorkingTimesById));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SingleNurseGetWorkingTimesNurseErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }
}
