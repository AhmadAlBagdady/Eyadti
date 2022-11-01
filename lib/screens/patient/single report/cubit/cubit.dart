import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/reports/get_single_report.dart';
import 'package:departments/screens/patient/single%20report/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleReportCubit extends Cubit<SingleReportState> {
  SingleReportCubit() : super(SingleReportInitialState());
  static SingleReportCubit get(context) => BlocProvider.of(context);

  void getSingleReport({
    required int id,
  }) {
    emit(SingleReportGetSingleReportLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getSingleReportUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetSingleReport getSingleReport;
        getSingleReport = GetSingleReport.fromJson(response.data);
        emit(SingleReportGetSingleReportSuccessState(getSingleReport));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SingleReportGetSingleReportErrorState(errorModel));
      } else {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
