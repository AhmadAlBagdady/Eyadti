import 'package:departments/models/doctor/get_my_patients.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/screens/shared/patients/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientsCubit extends Cubit<PatientsState> {
  PatientsCubit() : super(PatientsInitialState());

  static PatientsCubit get(context) => BlocProvider.of(context);

  void getMyPatients() {
    emit(PatientsGetMyPatientsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getMyPatientsUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetMyPatients getMyPatients;
        getMyPatients = GetMyPatients.fromJson(response.data);
        emit(PatientsGetMyPatientsSuccessState(getMyPatients));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(PatientsGetMyPatientsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
