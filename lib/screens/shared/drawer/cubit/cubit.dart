import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/settings/send_report.dart';
import 'package:departments/screens/shared/drawer/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitialState());

  static DrawerCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var contentController = TextEditingController();

  void sendReport({required String title, required String content}) {
    emit(DrawerSendReportLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(
            url: role == 'patient' ? sendReportUrl : sendMalfunctionUrl,
            data: {'title': title, 'content': content},
            token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late SendReport sendReport;
        sendReport = SendReport.fromJson(response.data);
        emit(DrawerSendReportSuccessState(sendReport));
      } else if (response.statusCode! < 500 && response.statusCode! >= 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(DrawerSendReportErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }
}
