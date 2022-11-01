import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/models/clinic/get_single_clinic.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/screens/patient/single%20clinic/cubit/state.dart';
import 'package:departments/screens/patient/single%20report/cubit/state.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/network/remote/end_point.dart';

class SingleClinicCubit extends Cubit<SingleClinicState> {
  SingleClinicCubit() : super(SingleClinicInitialState());
  static SingleClinicCubit get(context) => BlocProvider.of(context);

  void getSingleClinic(int id) {
    emit(SingleClinicLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getSingleClinicUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetSingleClinic getSingleClinic;
        getSingleClinic = GetSingleClinic.fromJson(response.data);
        emit(SingleClinicSuccessState(getSingleClinic));
      } else if (response.statusCode! < 500 && response.statusCode! >= 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SingleClinicErrorState(errorModel));
      }
    });
  }
}
