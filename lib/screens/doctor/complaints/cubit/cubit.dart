import 'package:bloc/bloc.dart';
import 'package:departments/models/complaints/get_my_malfunctions.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/screens/doctor/complaints/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';

class ComplaintsCubit extends Cubit<ComplaintsState> {
  ComplaintsCubit() : super(ComplaintsInitialState());

  List<bool> thisCardBe = [];

  void getMyMalfunctions() {
    emit(ComplaintsGetMyMalfunctionsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getMyMalfunctionsUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetMyMalfunctions getMyMalfunctions;
        getMyMalfunctions = GetMyMalfunctions.fromJson(response.data);
        thisCardBe = List.filled(
            getMyMalfunctions.data == null ? 0 : getMyMalfunctions.data!.length,
            true);
        emit(ComplaintsGetMyMalfunctionsSuccessState(
            getMyMalfunctions, thisCardBe));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(ComplaintsGetMyMalfunctionsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
