import 'package:bloc/bloc.dart';
import 'package:departments/models/certificates/get_certificates_by_id.dart';
import 'package:departments/models/doctor/get_doctor_by_id.dart';
import 'package:departments/models/working%20times/get_working_times_by_id.dart';
import 'package:departments/models/doctor/set_rating_doctor_by_id.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/screens/shared/single%20doctor/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleDoctorCubit extends Cubit<SingleDoctorState> {
  SingleDoctorCubit() : super(SingleDoctorInitialState());

  static SingleDoctorCubit get(context) => BlocProvider.of(context);

  bool isDoctorArrowClicked = false;

  void changeShowingList() {
    isDoctorArrowClicked = !isDoctorArrowClicked;
    emit(SingleDoctorChangeState());
  }

  List<String> listOfComplement = [
    'was bad',
    'was good',
    'was friendly',
    'was great',
    'was excellent'
  ];
  String complement = 'was friendly';
  int? ratingId;

  static List<List<String>> listOfSimilarDays = List.filled(7, []);
  static List<List<List<String>>> listOfSimilarTimes = List.filled(7, []);

  void changeRatingId(int rating) {
    ratingId = rating;
    emit(SingleDoctorChangeRatingSuccessState());
  }

  void changeComplement(int rating) {
    complement = listOfComplement[rating];
    emit(SingleDoctorChangeComplementSuccessState());
  }

  void getSingleDoctor({required int id}) {
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getSingleDoctorUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetDoctorById getDoctorById;
        getDoctorById = GetDoctorById.fromJson(response.data);
        emit(SingleDoctorGetSingleDoctorSuccessState(getDoctorById));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SingleDoctorGetSingleDoctorErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void getCertificatesDoctor({required int id}) {
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getCertificatesDoctorUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetCertificatesById getCertificatesById;
        getCertificatesById = GetCertificatesById.fromJson(response.data);
        emit(
            SingleDoctorGetCertificatesDoctorSuccessState(getCertificatesById));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SingleDoctorGetCertificatesDoctorErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void getWorkingTimesDoctor({required int id}) {
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getWorkingTimesDoctorUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetWorkingTimesById getWorkingTimesById;
        getWorkingTimesById = GetWorkingTimesById.fromJson(response.data);
        emit(
            SingleDoctorGetWorkingTimesDoctorSuccessState(getWorkingTimesById));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SingleDoctorGetWorkingTimesDoctorErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void setRatingDoctor({required int doctorId, required int ratingId}) {
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(
            url: setRatingDoctorUrl,
            data: {'doctor_id': doctorId, 'rating_id': ratingId},
            token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late SetRatingDoctorById setRatingDoctorById;
        setRatingDoctorById = SetRatingDoctorById.fromJson(response.data);
        emit(SingleDoctorSetRatingDoctorSuccessState(setRatingDoctorById));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SingleDoctorSetRatingDoctorErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }
}
