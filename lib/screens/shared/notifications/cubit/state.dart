import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/notifications/delete_notification.dart';
import 'package:departments/models/notifications/get_all_notifications.dart';

abstract class NotificationsState {}

class NotificationsInitialState extends NotificationsState {}

class NotificationsGetAllNotificationsSuccessState extends NotificationsState {
  final GetAllNotifications getAllNotifications;
  final List<bool> thisCardBe;
  NotificationsGetAllNotificationsSuccessState(
      this.getAllNotifications, this.thisCardBe);
}

class NotificationsGetAllNotificationsLoadingState extends NotificationsState {}

class NotificationsGetAllNotificationsErrorState extends NotificationsState {
  final ErrorModel errorModel;
  NotificationsGetAllNotificationsErrorState(this.errorModel);
}

class NotificationsDeleteNotificationSuccessState extends NotificationsState {
  final DeleteNotification deleteNotification;
  NotificationsDeleteNotificationSuccessState(this.deleteNotification);
}

class NotificationsDeleteNotificationLoadingState extends NotificationsState {}

class NotificationsDeleteNotificationErrorState extends NotificationsState {
  final ErrorModel errorModel;
  NotificationsDeleteNotificationErrorState(this.errorModel);
}
