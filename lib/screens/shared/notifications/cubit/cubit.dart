import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/notifications/delete_notification.dart';
import 'package:departments/models/notifications/get_all_notifications.dart';
import 'package:departments/screens/shared/notifications/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitialState());

  static NotificationsCubit get(context) => BlocProvider.of(context);

  static bool isThereNotification = false;

  void getNotifications() {
    emit(NotificationsGetAllNotificationsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .getData(url: getAllNotificationsUrl, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetAllNotifications getAllNotifications;
        getAllNotifications = GetAllNotifications.fromJson(response.data);
        List<bool> thisCardBe = List.filled(
            getAllNotifications.data == null
                ? 0
                : getAllNotifications.data!.length,
            true);
        emit(NotificationsGetAllNotificationsSuccessState(
            getAllNotifications, thisCardBe));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(NotificationsGetAllNotificationsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }

  void deleteNotification({
    required int id,
  }) {
    emit(NotificationsDeleteNotificationLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: deleteNotificationUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late DeleteNotification deleteNotification;
        deleteNotification = DeleteNotification.fromJson(response.data);
        emit(NotificationsDeleteNotificationSuccessState(deleteNotification));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(NotificationsDeleteNotificationErrorState(errorModel));
      } else {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
