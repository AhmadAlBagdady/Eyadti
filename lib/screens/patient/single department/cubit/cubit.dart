import 'package:bloc/bloc.dart';
import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/screens/patient/single%20department/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  DepartmentCubit() : super(DepartmentInitialState());

  static DepartmentCubit get(context) => BlocProvider.of(context);

  void getClinicById(int id) {
    emit(DepartmentGetClinicsByIdLoadingState());
    DioHelper dioHelper = DioHelper();
    late GetClinicsById getClinicsById;
    dioHelper
        .postData(url: getClinicsByIdUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        getClinicsById = GetClinicsById.fromJson(response.data);
        emit(DepartmentGetClinicsByIdSuccessState(
            getClinicsById, response.statusCode!));
      }
      if (response.statusCode! < 500 && response.statusCode! >= 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(DepartmentGetClinicsByIdErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
