import 'package:departments/layout/patient/patientCubit/cubit.dart';
import 'package:departments/layout/shared/cubit/cubit.dart';
import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/screens/patient/single%20clinic/single_clinic.dart';
import 'package:departments/screens/patient/single%20department/cubit/cubit.dart';
import 'package:departments/screens/patient/single%20department/cubit/state.dart';
import 'package:departments/screens/shared/notifications/notifications.dart';
import 'package:departments/screens/shared/search/search.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleDepartment extends StatelessWidget {
  SingleDepartment({Key? key, required this.id, required this.departmentName})
      : super(key: key);
  GetClinicsById? getClinicsById;
  final int id;
  final String departmentName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepartmentCubit()..getClinicById(id),
      child: BlocConsumer<DepartmentCubit, DepartmentState>(
        listener: (context, state) {
          if (state is DepartmentGetClinicsByIdSuccessState) {
            getClinicsById = state.getClinicsById;
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                elevation: 0,
                leading: Padding(
                  padding: EdgeInsets.only(left: size.width / 14),
                  child: appBarButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      size: size,
                      icon: MyIcons.angle_left),
                ),
                title: Text(
                  departmentName,
                  style: Fonts.semiBold(
                      size: size.height * 20 / 812, color: white),
                ),
                backgroundColor: lightBlue,
                actions: [
                  appBarButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Search(
                                  searchType: 'clinicDepartments',
                                  id: id,
                                )));
                      },
                      size: size,
                      icon: MyIcons.search),
                  Padding(
                    padding: EdgeInsets.only(
                        right: size.width * 34.34 / 375,
                        left: size.width * 17.13 / 375),
                    child: appBarButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Notifications()));
                        },
                        size: size,
                        icon: MyIcons.bell),
                  ),
                ]),
            body: getClinicsById == null
                ? const Center(child: CircularProgressIndicator())
                : getClinicsById!.data == null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              getClinicsById!.message!,
                              style: Fonts.fBold(
                                  size: size.height * 15 / 812, color: grey),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        width: size.width,
                        height: size.height,
                        child: ListView.separated(
                          itemCount: getClinicsById!.data!.length,
                          separatorBuilder: (context, index) => Container(
                            color: dividerColor,
                            height: size.height * 10 / 812,
                          ),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SingleClinic(
                                        id: getClinicsById!.data![index].id!,
                                        name:
                                            getClinicsById!.data![index].name!,
                                        cost: getClinicsById!
                                            .data![index].sessionPrice!,
                                      )))
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 36 / 375,
                                  top: size.height * 24 / 812,
                                  bottom: size.height * 26 / 812),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: size.width * 53.5 / 375,
                                    backgroundColor:
                                        veryLightBlue.withOpacity(0.5),
                                    child: CircleAvatar(
                                      backgroundColor: lightBlue,
                                      radius: size.width * 42.5 / 375,
                                      child: Icon(
                                        MyIcons.tooth1,
                                        size: size.width * 37 / 375,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 13 / 375,
                                        vertical: size.height * 11 / 812),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          enableTextWidth(
                                              12,
                                              getClinicsById!
                                                  .data![index].name!),
                                          style: Fonts.fBold(
                                              size: 14, color: darkBlue),
                                        ),
                                        SizedBox(
                                          height: size.height * 3 / 812,
                                        ),
                                        Text(
                                            '${getClinicsById!.data![index].sessionPrice!}',
                                            style: Fonts.fRegular(
                                                size: 13, color: lightGrey)),
                                        SizedBox(
                                          height: size.height * 10 / 812,
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: lightBlue,
                                              radius: size.width * 13.5 / 375,
                                              child: CircleAvatar(
                                                  radius: size.width * 12 / 375,
                                                  backgroundColor: white,
                                                  child: Icon(
                                                    MyIcons.user,
                                                    size: 12,
                                                    color: lightBlue,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: size.width * 5 / 375,
                                            ),
                                            Text(
                                              '${getClinicsById!.data![index].doctorsCount} ${LocaleKeys.doctors.tr().toLowerCase()}',
                                              style: Fonts.fBold(
                                                  size: 13, color: grey),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 40 / 375,
                                        vertical: size.height * 11 / 812),
                                    child: Text(
                                      LocaleKeys.open.tr().toUpperCase(),
                                      style:
                                          Fonts.fBold(size: 13, color: yellow),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
          );
        },
      ),
    );
  }
}
