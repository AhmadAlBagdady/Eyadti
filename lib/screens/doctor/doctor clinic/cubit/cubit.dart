import 'package:departments/models/clinic/get_my_clinic.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/screens/doctor/doctor%20clinic/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorClinicCubit extends Cubit<DoctorClinicState> {
  DoctorClinicCubit() : super(DoctorClinicInitialState());

  static DoctorClinicCubit get(context) => BlocProvider.of(context);

  bool isDoctorArrowClicked = true;
  bool isNurseArrowClicked = false;

  void changeShowingList(String isArrowClicked) {
    if (isArrowClicked == 'doctor') {
      isDoctorArrowClicked = !isDoctorArrowClicked;
    }
    if (isArrowClicked == 'nurse') isNurseArrowClicked = !isNurseArrowClicked;
    emit(DoctorClinicChangeState());
  }

  void getMyClinic() {
    emit(DoctorClinicGetMyClinicLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getDoctorClinicUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetMyClinic getMyClinic;
        getMyClinic = GetMyClinic.fromJson(response.data);
        emit(DoctorClinicGetMyClinicSuccessState(getMyClinic));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(DoctorClinicGetMyClinicErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }
}
