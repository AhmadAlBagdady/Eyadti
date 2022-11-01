import 'package:departments/models/doctor/get_all_doctors.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/screens/shared/doctors/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsCubit extends Cubit<DoctorsState>{
  DoctorsCubit(): super(DoctorsInitialState());
  
  static DoctorsCubit get(context)=>BlocProvider.of(context);

  void getDoctors() {
    emit(DoctorsGetDoctorsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getAllDoctorUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetAllDoctors getAllDoctors;
        getAllDoctors = GetAllDoctors.fromJson(response.data);
        emit(DoctorsGetDoctorsSuccessState(
            getAllDoctors));
      } else if (response.statusCode! < 500 && response.statusCode! >= 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(DoctorsGetDoctorsErrorState(errorModel));
      }else if(response.statusCode!>=500){
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
  void setValue(){
    emit(DoctorsInitialState());
  }
}