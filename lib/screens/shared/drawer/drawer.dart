import 'package:departments/layout/doctor/doctorCubit/cubit.dart';
import 'package:departments/layout/shared/cubit/cubit.dart';
import 'package:departments/screens/doctor/complaints/complaints.dart';
import 'package:departments/screens/shared/doctors/doctors.dart';
import 'package:departments/screens/shared/drawer/cubit/cubit.dart';
import 'package:departments/screens/shared/drawer/cubit/state.dart';
import 'package:departments/screens/shared/login/login_screen.dart';
import 'package:departments/screens/shared/news/news.dart';
import 'package:departments/screens/shared/profile/profile.dart';
import 'package:departments/screens/shared/settings/settings.dart';
import 'package:departments/shared/components/drawer_list_tile.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/custom_complaint_dialog.dart';
import 'package:departments/shared/widgets/custom_drawer_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainCubit mainCubit = MainCubit.get(context);
    double sizeIcon = size.width * 24 / 375;
    return BlocProvider(
      create: (context) => DrawerCubit(),
      child: BlocConsumer<DrawerCubit, DrawerState>(
        listener: (context, state) {
          if (state is DrawerSendReportSuccessState) {
            showToast(msg: state.sendReport.message!, color: green);
            Navigator.of(context).pop();
          } else if (state is DrawerSendReportErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          DrawerCubit drawerCubit = DrawerCubit.get(context);
          return SizedBox(
            width: size.width / 1.13,
            child: Drawer(
              child: Column(
                children: [
                  const CustomDrawerHeader(),
                  drawerListTile(
                      sizeIcon: sizeIcon,
                      iconData: MyIcons.user,
                      title: LocaleKeys.profile.tr(),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Profile()));
                      }),
                  role == 'Patient'
                      ? drawerListTile(
                          sizeIcon: size.width * 24 / 375,
                          iconData: MyIcons.stethoscope,
                          title: LocaleKeys.doctors.tr(),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Doctors()));
                          })
                      : Container(),
                  role == 'Doctor'
                      ? drawerListTile(
                          sizeIcon: size.width * 24 / 375,
                          iconData: Icons.people_outlined,
                          title: LocaleKeys.patients.tr(),
                          onTap: () {
                            Navigator.of(context).pop();
                            mainCubit.changeBottomNav(2);
                          })
                      : Container(),
                  MainCubit.isBlogActive!
                      ? drawerListTile(
                          sizeIcon: sizeIcon,
                          iconData: Icons.image_outlined,
                          title: LocaleKeys.dailyUpdate.tr(),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => News()));
                          })
                      : Container(),
                  drawerListTile(
                      sizeIcon: sizeIcon,
                      iconData: MyIcons.document,
                      title: LocaleKeys.myReports.tr(),
                      onTap: () {
                        Navigator.of(context).pop();
                        mainCubit.changeBottomNav(3);
                      }),
                  drawerListTile(
                      sizeIcon: sizeIcon,
                      iconData: MyIcons.calendar,
                      title: LocaleKeys.myAppointments.tr(),
                      onTap: () {
                        Navigator.of(context).pop();
                        mainCubit.changeBottomNav(1);
                      }),
                  role == 'Doctor'
                      ? drawerListTile(
                          sizeIcon: sizeIcon,
                          iconData: Icons.comment_bank_outlined,
                          title: LocaleKeys.myComplaints.tr(),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Complaints()));
                          })
                      : Container(),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width / 20, vertical: 0),
                    child: const Divider(
                      color: lightBlue,
                      thickness: 2,
                    ),
                  ),
                  drawerListTile(
                      sizeIcon: sizeIcon,
                      iconData: Icons.error_outline,
                      title: LocaleKeys.sendComplaint.tr(),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AddComplaintDialog(
                                  drawerCubit: drawerCubit,
                                  materialButtonChild: state
                                          is DrawerSendReportLoadingState
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : Text(
                                          LocaleKeys.send.tr(),
                                          style: Fonts.fBold(
                                              size: size.height * 16 / 812,
                                              color: white),
                                        ),
                                  onPressed: () {
                                    if (drawerCubit.formKey.currentState!
                                        .validate()) {
                                      drawerCubit.sendReport(
                                          title:
                                              drawerCubit.titleController.text,
                                          content: drawerCubit
                                              .contentController.text);
                                      drawerCubit.titleController.text = '';
                                      drawerCubit.contentController.text = '';
                                    }
                                    Navigator.pop(context);
                                  },
                                ));
                      }),
                  drawerListTile(
                      sizeIcon: sizeIcon,
                      iconData: MyIcons.settings_1,
                      title: LocaleKeys.settings.tr(),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Settings()));
                      }),
                  drawerListTile(
                      sizeIcon: sizeIcon,
                      iconData: MyIcons.sign_out,
                      title: LocaleKeys.signOut.tr(),
                      onTap: () {
                        mainCubit.logout(context).then((value) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => LoginScreen(),
                            ),
                            (route) => false,
                          );
                        });
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
