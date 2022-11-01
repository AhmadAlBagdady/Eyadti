import 'package:departments/models/notifications/delete_notification.dart';
import 'package:departments/models/notifications/get_all_notifications.dart';
import 'package:departments/screens/shared/notifications/cubit/cubit.dart';
import 'package:departments/screens/shared/notifications/cubit/state.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/notification_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Notifications extends StatelessWidget {
  Notifications({Key? key}) : super(key: key);

  GetAllNotifications? getAllNotifications;
  DeleteNotification? deleteNotification;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit()..getNotifications(),
      child: BlocConsumer<NotificationsCubit, NotificationsState>(
          listener: (context, state) {
        if (state is NotificationsGetAllNotificationsSuccessState) {
          getAllNotifications = state.getAllNotifications;
        } else if (state is NotificationsGetAllNotificationsErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
        if (state is NotificationsDeleteNotificationSuccessState) {
          showToast(msg: state.deleteNotification.message!, color: green);
          deleteNotification = state.deleteNotification;
        } else if (state is NotificationsDeleteNotificationErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
      }, builder: (context, state) {
        NotificationsCubit notificationsCubit = NotificationsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(left: size.width / 14),
              child: appBarButton(
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                  size: size,
                  icon: MyIcons.angle_left),
            ),
            title:  Text(LocaleKeys.myNotifications.tr()),
            backgroundColor: lightBlue,
          ),
          body: getAllNotifications == null
              ? const Center(child: CircularProgressIndicator())
              : getAllNotifications!.data == null
                  ? Center(
                      child: Text(
                        getAllNotifications!.message!,
                        style: Fonts.fBold(
                            size: size.height * 20 / 812, color: grey),
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        NotificationsCubit.get(context).getNotifications();
                      },
                      child: Container(
                        width: size.width,
                        height: size.height,
                        color: white,
                        child: ListView.separated(
                          padding: EdgeInsets.only(bottom: size.height / 10),
                          separatorBuilder: (context, index) => Container(
                            color: dividerColor,
                            height: size.height / 81.2,
                          ),
                          itemBuilder: (context, index) =>
                              state is NotificationsGetAllNotificationsSuccessState &&
                                      state.thisCardBe[index]
                                  ? NotificationCard(
                                      title: getAllNotifications!
                                          .data![index].title!,
                                      doctorName: getAllNotifications!
                                          .data![index].senderName!,
                                      numOfDays: fromHoursToDays(
                                          getAllNotifications!
                                              .data![index].hoursAgo!),
                                      onPressed: () {
                                        notificationsCubit.deleteNotification(
                                            id: getAllNotifications!
                                                .data![index].id!);
                                        state.thisCardBe[index] = false;
                                      },
                                    )
                                  : Container(),
                          itemCount: getAllNotifications!.data!.length,
                        ),
                      ),
                    ),
        );
      }),
    );
  }
}
