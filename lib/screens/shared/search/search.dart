import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/models/clinic/search_clinic_departments.dart';
import 'package:departments/models/complaints/search_complaints.dart';
import 'package:departments/models/department/search_departments.dart';
import 'package:departments/models/doctor/search_doctors.dart';
import 'package:departments/models/news/search_blog_departments.dart';
import 'package:departments/models/news/search_post_departments.dart';
import 'package:departments/screens/shared/search/cubit/cubit.dart';
import 'package:departments/screens/shared/search/cubit/state.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  Search({Key? key, required this.searchType, this.id}) : super(key: key);

  int? id;
  String searchType;
  SearchDepartments? searchDepartments;
  SearchBlogDepartments? searchBlogDepartments;
  SearchPostDepartments? searchPostDepartments;
  SearchClinicDepartments? searchClinicDepartments;
  SearchDoctors? searchDoctors;
  SearchComplaints? searchComplaints;
  GetClinicsById? getClinicsById;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(listener: (context, state) {
        if (state is SearchDepartmentsSuccessState) {
          searchDepartments = state.searchDepartments;
          if (searchDepartments!.data == null) {
            SearchCubit.searchDataThereIsDepartments = false;
          } else if (searchDepartments!.data != null) {
            SearchCubit.searchDataLength = searchDepartments!.data!.length;
            SearchCubit.makeItTrue(searchType);
          }
          SearchCubit.searchDataMassage = searchDepartments!.message!;
        } else if (state is SearchDepartmentsErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
        if (state is SearchDepartmentsGetClinicsByIdSuccessState) {
          getClinicsById = state.getClinicsById;
        } else if (state is SearchDepartmentsGetClinicsByIdErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
        if (state is SearchDoctorsSuccessState) {
          searchDoctors = state.searchDoctors;
          if (searchDoctors!.data == null) {
            SearchCubit.searchDataThereIsDoctors = false;
          } else if (searchDoctors!.data != null) {
            SearchCubit.searchDataLength = searchDoctors!.data!.length;
            SearchCubit.makeItTrue(searchType);
          }
          SearchCubit.searchDataMassage = searchDoctors!.message!;
        } else if (state is SearchDoctorsErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
        if (state is SearchComplaintsSuccessState) {
          searchComplaints = state.searchComplaints;
          if (searchComplaints!.data == null) {
            SearchCubit.searchDataThereIsComplaints = false;
          } else if (searchComplaints!.data != null) {
            SearchCubit.searchDataLength = searchComplaints!.data!.length;
            SearchCubit.makeItTrue(searchType);
          }
          SearchCubit.searchDataMassage = searchComplaints!.message!;
        } else if (state is SearchComplaintsErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
        if (state is SearchBlogDepartmentsSuccessState) {
          searchBlogDepartments = state.searchBlogDepartments;
          if (searchBlogDepartments!.data == null) {
            SearchCubit.searchDataThereIsBlogDepartments = false;
          } else if (searchBlogDepartments!.data != null) {
            SearchCubit.searchDataLength = searchBlogDepartments!.data!.length;
            SearchCubit.makeItTrue(searchType);
          }
          SearchCubit.searchDataMassage = searchBlogDepartments!.message!;
        } else if (state is SearchBlogDepartmentsErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
        if (state is SearchPostDepartmentsSuccessState) {
          searchPostDepartments = state.searchPostDepartments;
          if (searchPostDepartments!.data == null) {
            SearchCubit.searchDataThereIsPostDepartments = false;
          } else if (searchPostDepartments!.data != null) {
            SearchCubit.searchDataLength = searchPostDepartments!.data!.length;
            SearchCubit.makeItTrue(searchType);
          }
          SearchCubit.searchDataMassage = searchPostDepartments!.message!;
        } else if (state is SearchPostDepartmentsErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }

        if (state is SearchClinicDepartmentsSuccessState) {
          searchClinicDepartments = state.searchClinicDepartments;
          if (searchClinicDepartments!.data == null) {
            SearchCubit.searchDataThereIsClinicDepartments = false;
          } else if (searchClinicDepartments!.data != null) {
            SearchCubit.searchDataLength =
                searchClinicDepartments!.data!.length;
            SearchCubit.makeItTrue(searchType);
          }
          SearchCubit.searchDataMassage = searchClinicDepartments!.message!;
        } else if (state is SearchClinicDepartmentsErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
      }, builder: (context, state) {
        SearchCubit searchCubit = SearchCubit.get(context);
        return Semantics(
            explicitChildNodes: true,
            scopesRoute: true,
            namesRoute: true,
            child: Theme(
              data: ThemeData.light(),
              child: Scaffold(
                appBar: AppBar(
                    backgroundColor: white,
                    leading: Padding(
                      padding: EdgeInsets.only(left: size.width / 14),
                      child: appBarButton(
                          onPressed: () {
                            Navigator.of(context).pop(context);
                          },
                          size: size,
                          icon: MyIcons.angle_left,
                          color: lightGrey),
                    ),
                    title: TextField(
                      controller: searchCubit.searchController,
                      focusNode: FocusNode(),
                      onSubmitted: (textInput) {
                        searchCubit.searchData(
                            searchType: searchType,
                            dataName: textInput,
                            id: id);
                        searchCubit.thereIsText =
                            textInput == '' ? false : true;
                      },
                      style: const TextTheme().headline6,
                      textInputAction: TextInputAction.search,
                      decoration: const InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                    )),
                body: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: state is SearchDepartmentsLoadingState ||
                            state
                                is SearchDepartmentsGetClinicsByIdLoadingState ||
                            state is SearchDoctorsLoadingState ||
                            state is SearchBlogDepartmentsLoadingState ||
                            state is SearchPostDepartmentsLoadingState ||
                            state is SearchClinicDepartmentsLoadingState ||
                            state is SearchComplaintsLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : SearchCubit.searchDataThereIsDepartments &&
                                getClinicsById != null
                            ? ListView.separated(
                                itemBuilder: (context, index) => searchCubit.searchDataResultDepartments(
                                    context: context,
                                    index: index,
                                    searchDepartments: searchDepartments!,
                                    getClinicsById: getClinicsById!),
                                separatorBuilder: (context, index) => Container(
                                      color: dividerColor,
                                      height: size.height / 81.2,
                                    ),
                                itemCount: SearchCubit.searchDataLength)
                            : SearchCubit.searchDataThereIsDoctors
                                ? ListView.separated(
                                    itemBuilder: (context, index) =>
                                        searchCubit.searchDataResultDoctors(
                                            searchDoctors: searchDoctors!,
                                            context: context,
                                            index: index),
                                    separatorBuilder: (context, index) =>
                                        Container(
                                          color: dividerColor,
                                          height: size.height / 81.2,
                                        ),
                                    itemCount: SearchCubit.searchDataLength)
                                : SearchCubit.searchDataThereIsComplaints
                                    ? ListView.separated(
                                        itemBuilder: (context, index) =>
                                            searchCubit.searchDataResultComplaints(
                                                searchComplaints:
                                                    searchComplaints!,
                                                context: context,
                                                index: index),
                                        separatorBuilder: (context, index) =>
                                            Container(
                                              color: dividerColor,
                                              height: size.height / 81.2,
                                            ),
                                        itemCount: SearchCubit.searchDataLength)
                                    : SearchCubit
                                            .searchDataThereIsBlogDepartments
                                        ? GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 1,
                                            ),
                                            itemBuilder: (context, index) {
                                              return searchCubit
                                                  .searchDataResultBlogDepartments(
                                                      searchBlogDepartments:
                                                          searchBlogDepartments!,
                                                      context: context,
                                                      index: index);
                                            },
                                            itemCount:
                                                SearchCubit.searchDataLength,
                                          )
                                        : SearchCubit
                                                .searchDataThereIsPostDepartments
                                            ? ListView.separated(
                                                itemBuilder: (context, index) =>
                                                    searchCubit.searchDataResultPostDepartments(
                                                        searchPostDepartments: searchPostDepartments!,
                                                        context: context,
                                                        index: index),
                                                separatorBuilder: (context, index) => Container(
                                                      color: dividerColor,
                                                      height:
                                                          size.height / 81.2,
                                                    ),
                                                itemCount: SearchCubit.searchDataLength)
                                            : SearchCubit.searchDataThereIsClinicDepartments
                                                ? ListView.separated(
                                                    itemBuilder: (context, index) => searchCubit.searchDataResultClinicDepartments(searchClinicDepartments: searchClinicDepartments!, context: context, index: index),
                                                    separatorBuilder: (context, index) => Container(
                                                          color: dividerColor,
                                                          height: size.height /
                                                              81.2,
                                                        ),
                                                    itemCount: SearchCubit.searchDataLength)
                                                : searchCubit.thereIsText && (!SearchCubit.searchDataThereIsDepartments || !SearchCubit.searchDataThereIsDoctors || !SearchCubit.searchDataThereIsComplaints || !SearchCubit.searchDataThereIsBlogDepartments || !SearchCubit.searchDataThereIsClinicDepartments || !SearchCubit.searchDataThereIsPostDepartments)
                                                    ? Center(
                                                        child: Text(
                                                          SearchCubit
                                                              .searchDataMassage,
                                                          style: Fonts.fBold(
                                                              size:
                                                                  size.height *
                                                                      20 /
                                                                      812,
                                                              color: lightGrey),
                                                        ),
                                                      )
                                                    : Container()),
              ),
            ));
      }),
    );
  }
}
