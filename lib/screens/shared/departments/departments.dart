import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/models/department/get_all_departments.dart';
import 'package:departments/models/department/search_departments.dart';
import 'package:departments/screens/patient/single%20department/single_department.dart';
import 'package:departments/screens/shared/departments/cubit/cubit.dart';
import 'package:departments/screens/shared/departments/cubit/state.dart';
import 'package:departments/screens/shared/search/search.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/widgets/custom_app_bar.dart';
import 'package:departments/shared/widgets/custom_clinics_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Departments extends StatelessWidget {
  Departments({Key? key}) : super(key: key);
  GetDepartments? getDepartments;
  List<GetClinicsById>? clinics;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepartmentsCubit()..getAll(),
      child: BlocConsumer<DepartmentsCubit, DepartmentsState>(
        listener: (context, state) {
          if (state is DepartmentsGetAllSuccessState) {
            clinics = state.list;
            getDepartments = state.getDepartments;
          } else if (state is DepartmentsGetAllErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: CustomAppBar(
                title: 'Departments',
                onPressedSearch: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search(
                            searchType: 'departments',
                          )));
                },
              ),
              body: Container(
                color: white,
                width: size.width,
                height: double.infinity,
                child: getDepartments == null
                    ? const Center(child: CircularProgressIndicator())
                    : getDepartments != null
                        ? getDepartments!.data == null
                            ? Center(
                                child: Text(
                                  getDepartments!.message!,
                                  style:
                                      Fonts.fBold(size: size.height * 16 / 812),
                                ),
                              )
                            : ListView.separated(
                                itemCount: getDepartments!.data!.length,
                                padding:
                                    EdgeInsets.only(bottom: size.height / 10),
                                separatorBuilder: (context, index) => Container(
                                  color: dividerColor,
                                  height: size.height / 81.2,
                                ),
                                itemBuilder: (context, index) =>
                                    CustomClinicsList(
                                  clinicsList: clinics![index].data!,
                                  id: index,
                                  name: getDepartments!.data![index].name!,
                                  seeAllFunc: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SingleDepartment(
                                                    id: getDepartments!
                                                        .data![index].id!,
                                                    departmentName:
                                                        getDepartments!
                                                            .data![index]
                                                            .name!)));
                                  },
                                ),
                              )
                        : Container(),
              ));
        },
      ),
    );
  }
}
