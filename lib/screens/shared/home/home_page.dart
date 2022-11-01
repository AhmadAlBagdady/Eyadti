import 'package:departments/layout/reception/scan_qr_code.dart';
import 'package:departments/layout/shared/cubit/cubit.dart';
import 'package:departments/models/appointments/get_calender.dart';
import 'package:departments/models/complaints/get_last_complaint.dart';
import 'package:departments/models/department/get_all_departments.dart';
import 'package:departments/models/doctor/get_all_doctors.dart';
import 'package:departments/models/news/get_last_post.dart';
import 'package:departments/models/patient/get_last_patient.dart';
import 'package:departments/screens/doctor/repairs/repairs.dart';
import 'package:departments/screens/shared/home/homeCubit/cubit.dart';
import 'package:departments/screens/shared/home/homeCubit/states.dart';
import 'package:departments/screens/shared/news/news.dart';
import 'package:departments/screens/shared/notifications/cubit/cubit.dart';
import 'package:departments/screens/shared/notifications/notifications.dart';
import 'package:departments/screens/shared/single%20patient/single_patient.dart';
import 'package:departments/screens/shared/single%20post/single_post.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/local/cach_helper.dart';
import 'package:departments/shared/widgets/custom_calendar.dart';
import 'package:departments/shared/widgets/custom_departments_list.dart';
import 'package:departments/shared/widgets/custom_doctors_list.dart';
import 'package:departments/shared/widgets/custom_post_card.dart';
import 'package:departments/shared/widgets/pending_patient_card.dart';
import 'package:departments/shared/widgets/repair_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui;

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var _controller = ScrollController();

  GetAllDoctors? getAllDoctors;
  GetDepartments? getAllDepartments;
  GetLastPost? getLastPost;
  GetCalender? getCalender;
  GetLastComplaint? getLastComplaint;
  GetLastPatient? getLastPatient;
  bool isCreated = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..home(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetDoctorsSuccessState) {
            getAllDoctors = state.getAllDoctors;
          } else if (state is HomeGetDoctorsErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }

          if (state is HomeGetDepartmentsSuccessState) {
            getAllDepartments = state.getAllDepartments;
          } else if (state is HomeGetDepartmentsErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }

          if (state is HomeGetLastPostSuccessState) {
            getLastPost = state.getLastPost;
          } else if (state is HomeGetLastPostErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }

          if (state is HomeGetCalenderSuccessState) {
            getCalender = state.getCalender;
          } else if (state is HomeGetCalenderErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }

          if (state is HomeIsBlogActiveSuccessState) {
            MainCubit.isBlogActive = state.isBlogActive.data;
          }

          if (state is HomeIsThereNotificationsSuccessState) {
            NotificationsCubit.isThereNotification =
                state.isThereNotifications.data!;
          } else if (state is HomeIsThereNotificationsErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
          if (state is HomeGetLastComplaintSuccessState) {
            getLastComplaint = state.getLastComplaint;
          } else if (state is HomeGetLastComplaintErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
          if (state is HomeGetLastPatientSuccessState) {
            getLastPatient = state.getLastPatient;
          } else if (state is HomeGetLastPatientErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          MainCubit mainCubit = MainCubit.get(context);
          HomeCubit homeCubit = HomeCubit.get(context);

          return RefreshIndicator(
            onRefresh: () async {
              HomeCubit.get(context).home();
            },
            child: CustomScrollView(
              controller: _controller,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  stretch: true,
                  elevation: 0,
                  backgroundColor: lightBlue,
                  leading: Padding(
                    padding: EdgeInsets.only(left: size.width * 34 / 375),
                    child: appBarButton(
                        size: size,
                        onPressed: () {
                          mainCubit.layoutKey.currentState!.openDrawer();
                        },
                        icon: MyIcons.list),
                  ),
                  actions: [
                    Padding(
                        padding: EdgeInsets.only(
                          right: size.width * 19.34 / 375,
                        ),
                        child: appBarNotificationButton(
                            onPressed: () {
                              NotificationsCubit.isThereNotification = false;
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Notifications()));
                            },
                            size: size)),
                  ],
                  title: Text(LocaleKeys.homePage.tr()),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [lightBlue, darkBlue],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                      ),
                      padding: EdgeInsets.only(
                          left: size.width / 11,
                          right: size.width / 11,
                          bottom: size.width / 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.helloAgain.tr(),
                            style: Fonts.fRegular(
                                size: size.width / 26.7, color: white),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            CacheHelper.getData(key: 'name'),
                            style: Fonts.fBold(
                                size: size.width / 17, color: white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: size.width / 1.22,
                            height: size.height / 18.45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                textAlign: TextAlign.start,
                                textInputAction: TextInputAction.search,
                                cursorHeight: 30,
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    label: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 24.0),
                                      child: Text(
                                        LocaleKeys.search.tr(),
                                        style: Fonts.fRegular(
                                            size: size.width / 26.7,
                                            color: grey),
                                      ),
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  expandedHeight: size.height / 3.35,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 34 / 375,
                                    right: size.width * 34 / 375,
                                    top: size.height / 58),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      LocaleKeys.appointment.tr().toUpperCase(),
                                      style:
                                          Fonts.fBold(size: size.width / 28.8),
                                    ),
                                    textButton(
                                        text: LocaleKeys.seeAll
                                            .tr()
                                            .toUpperCase(),
                                        color: yellow,
                                        fontStyle: Fonts.semiBold(
                                            size: size.width * 13 / 375,
                                            color: yellow),
                                        function: () {
                                          mainCubit.changeBottomNav(1);
                                        }),
                                  ],
                                ),
                              ),
                              getCalender == null
                                  ? CircularProgressIndicator()
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 20 / 375),
                                      child: Calendar(
                                          date: List.generate(
                                              getCalender!.data?.length ?? 0,
                                              (index) => DateTime.utc(
                                                  DateTime.parse(getCalender!
                                                          .data![index])
                                                      .year,
                                                  DateTime.parse(getCalender!
                                                          .data![index])
                                                      .month,
                                                  DateTime.parse(getCalender!
                                                          .data![index])
                                                      .day))),
                                    ),
                            ],
                          ),
                          homeCubit.isActive!
                              ? Container(
                                  color: dividerColor,
                                  height: size.height * 10 / 812,
                                )
                              : Container(),
                          role == 'Doctor'
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.height * 2 / 812,
                                          horizontal: size.width * 34 / 375),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            LocaleKeys.nextPatient
                                                .tr()
                                                .toUpperCase(),
                                            style: Fonts.fBold(
                                                size: 13, color: black),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                mainCubit.changeBottomNav(2);
                                              },
                                              child: Text(
                                                LocaleKeys.seeAll
                                                    .tr()
                                                    .toUpperCase(),
                                                style: Fonts.fBold(
                                                    size:
                                                        size.height * 13 / 812,
                                                    color: yellow),
                                              ))
                                        ],
                                      ),
                                    ),
                                    getLastPatient == null
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : getLastPatient!.data == null
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Text(
                                                  getLastPatient!.message!,
                                                  style: Fonts.fBold(
                                                      size: size.height *
                                                          20 /
                                                          812,
                                                      color: grey),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SinglePatient(
                                                                patientId:
                                                                    getLastPatient!
                                                                        .data!
                                                                        .patientId!,
                                                              )));
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          size.width * 34 / 375,
                                                      vertical: size.height *
                                                          20 /
                                                          812),
                                                  child: PendingPatientCard(
                                                    name: getLastPatient!.data!
                                                            .patientName ??
                                                        '',
                                                    age: getLastPatient!
                                                            .data!.age ??
                                                        0,
                                                  ),
                                                ),
                                              ),
                                    Container(
                                      color: dividerColor,
                                      height: size.height * 10 / 812,
                                    )
                                  ],
                                )
                              : Container(),
                          homeCubit.isActive!
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width / 11,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            LocaleKeys.lastNews
                                                .tr()
                                                .toUpperCase(),
                                            style: Fonts.fBold(
                                                size: size.width / 28.8),
                                          ),
                                          SizedBox(
                                            height: size.height / 42.7,
                                          ),
                                          const Spacer(),
                                          textButton(
                                              text: LocaleKeys.seeAll
                                                  .tr()
                                                  .toUpperCase(),
                                              color: yellow,
                                              fontStyle: Fonts.fBold(
                                                  size: size.width / 28.8,
                                                  color: yellow),
                                              function: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            News()));
                                              })
                                        ],
                                      ),
                                    ),
                                    getLastPost == null
                                        ? const Center(
                                            child: CircularProgressIndicator())
                                        : getLastPost!.data == null
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Text(
                                                  getLastPost!.message!,
                                                  style: Fonts.fBold(
                                                      size: size.height *
                                                          20 /
                                                          812,
                                                      color: grey),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder:
                                                              (context) =>
                                                                  SinglePost(
                                                                    departmentName:
                                                                        '',
                                                                    id: getLastPost!
                                                                        .data!
                                                                        .id!,
                                                                    image: getLastPost!
                                                                        .data!
                                                                        .image,
                                                                    title: getLastPost!
                                                                        .data!
                                                                        .postTitle!,
                                                                    publisher:
                                                                        getLastPost!
                                                                            .data!
                                                                            .publisherName!,
                                                                    likeNum: getLastPost!
                                                                        .data!
                                                                        .likes!,
                                                                    viewNum: getLastPost!
                                                                        .data!
                                                                        .views!,
                                                                    date: getLastPost!
                                                                        .data!
                                                                        .postDate!,
                                                                  )));
                                                },
                                                child: PostCard(
                                                    image: getLastPost!
                                                        .data!.image,
                                                    title: getLastPost!
                                                        .data!.postTitle!,
                                                    publisher: getLastPost!
                                                        .data!.publisherName!,
                                                    likeNum: getLastPost!
                                                        .data!.likes!,
                                                    viewNum: getLastPost!
                                                        .data!.views!,
                                                    date: getLastPost!
                                                        .data!.postDate!),
                                              )
                                  ],
                                )
                              : Container(),
                          Container(
                            color: dividerColor,
                            height: size.height * 10 / 812,
                          ),
                          role == 'Patient'
                              ? Column(
                                  children: [
                                    getAllDepartments == null
                                        ? const CircularProgressIndicator()
                                        : getAllDepartments != null
                                            ? getAllDepartments!.data == null
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Text(
                                                      getAllDepartments!
                                                          .message!,
                                                      style: Fonts.fBold(
                                                          size: size.height *
                                                              20 /
                                                              812,
                                                          color: grey),
                                                    ),
                                                  )
                                                : CustomDepartmentsList(
                                                    seeAllFunc: () {
                                                      mainCubit
                                                          .changeBottomNav(3);
                                                    },
                                                    namesList:
                                                        getAllDepartments!
                                                            .data!)
                                            : Container(),
                                    Container(
                                      color: dividerColor,
                                      height: size.height * 10 / 812,
                                    ),
                                    getAllDoctors == null
                                        ? CircularProgressIndicator()
                                        : getAllDoctors!.data == null
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Text(
                                                  getAllDoctors!.message!,
                                                  style: Fonts.fBold(
                                                      size: size.height *
                                                          20 /
                                                          812,
                                                      color: grey),
                                                ),
                                              )
                                            : CustomDoctorsList(
                                                doctorsList:
                                                    getAllDoctors!.data!)
                                  ],
                                )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.height * 2 / 812,
                                          horizontal: size.width * 34 / 375),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            LocaleKeys.repairs
                                                .tr()
                                                .toUpperCase(),
                                            style: Fonts.fBold(
                                                size: 13, color: black),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Repairs()));
                                              },
                                              child: Text(
                                                LocaleKeys.seeAll
                                                    .tr()
                                                    .toUpperCase(),
                                                style: Fonts.fBold(
                                                    size:
                                                        size.height * 13 / 812,
                                                    color: yellow),
                                              ))
                                        ],
                                      ),
                                    ),
                                    getLastComplaint == null
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : getLastComplaint!.data == null
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Text(
                                                  getLastComplaint!.message!,
                                                  style: Fonts.fBold(
                                                      size: size.height *
                                                          20 /
                                                          812,
                                                      color: grey),
                                                ),
                                              )
                                            : RepairCard(
                                                title: getLastComplaint!
                                                    .data!.title!,
                                                status: getLastComplaint!
                                                    .data!.statues!,
                                                time: getLastComplaint!
                                                    .data!.hoursAgo!,
                                              ),
                                    // Container(height: size.height* 10 /812,color: dividerColor,)
                                  ],
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 70 / 812,
                    ),
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
