import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/models/clinic/search_clinic_departments.dart';
import 'package:departments/models/complaints/search_complaints.dart';
import 'package:departments/models/department/search_departments.dart';
import 'package:departments/models/doctor/search_doctors.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/search_blog_departments.dart';
import 'package:departments/models/news/search_post_departments.dart';
import 'package:departments/screens/patient/single%20department/single_department.dart';
import 'package:departments/screens/shared/departments/cubit/cubit.dart';
import 'package:departments/screens/shared/search/cubit/state.dart';
import 'package:departments/screens/shared/single%20doctor/single_doctor.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/widgets/clinic_card.dart';
import 'package:departments/shared/widgets/complaint_card.dart';
import 'package:departments/shared/widgets/custom_clinics_list.dart';
import 'package:departments/shared/widgets/custom_post_card.dart';
import 'package:departments/shared/widgets/department_card.dart';
import 'package:departments/shared/widgets/doctor_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:departments/shared/network/remote/end_point.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();
  bool thereIsText = false;
  static int searchDataLength = 0;
  static String searchDataMassage = LocaleKeys.notFound.tr();
  static bool searchDataThereIsDoctors = false;
  static bool searchDataThereIsDepartments = false;
  static bool searchDataThereIsBlogDepartments = false;
  static bool searchDataThereIsPostDepartments = false;
  static bool searchDataThereIsClinicDepartments = false;
  static bool searchDataThereIsComplaints = false;

  static makeItTrue(String type) {
    if (type == 'doctor') {
      searchDataThereIsDoctors = true;
      searchDataThereIsDepartments = false;
      searchDataThereIsBlogDepartments = false;
      searchDataThereIsPostDepartments = false;
      searchDataThereIsClinicDepartments = false;
      searchDataThereIsComplaints = false;
    } else if (type == 'departments') {
      searchDataThereIsDoctors = false;
      searchDataThereIsDepartments = true;
      searchDataThereIsBlogDepartments = false;
      searchDataThereIsPostDepartments = false;
      searchDataThereIsClinicDepartments = false;
      searchDataThereIsComplaints = false;
    } else if (type == 'blogDepartments') {
      searchDataThereIsDoctors = false;
      searchDataThereIsDepartments = false;
      searchDataThereIsBlogDepartments = true;
      searchDataThereIsPostDepartments = false;
      searchDataThereIsClinicDepartments = false;
      searchDataThereIsComplaints = false;
    } else if (type == 'postDepartments') {
      searchDataThereIsDoctors = false;
      searchDataThereIsDepartments = false;
      searchDataThereIsBlogDepartments = false;
      searchDataThereIsPostDepartments = true;
      searchDataThereIsClinicDepartments = false;
      searchDataThereIsComplaints = false;
    } else if (type == 'clinicDepartments') {
      searchDataThereIsDoctors = false;
      searchDataThereIsDepartments = false;
      searchDataThereIsBlogDepartments = false;
      searchDataThereIsPostDepartments = true;
      searchDataThereIsClinicDepartments = true;
      searchDataThereIsComplaints = false;
    } else if (type == 'complaints') {
      searchDataThereIsDoctors = false;
      searchDataThereIsDepartments = false;
      searchDataThereIsBlogDepartments = false;
      searchDataThereIsPostDepartments = true;
      searchDataThereIsClinicDepartments = false;
      searchDataThereIsComplaints = true;
    }
  }

  void searchData(
      {required String searchType, required String dataName, int? id}) {
    if (searchType == 'departments') {
      searchDepartments(departmentName: dataName);
    } else if (searchType == 'doctors') {
      searchDoctors(doctorName: dataName);
    } else if (searchType == 'complaints') {
      searchComplaints(complaintName: dataName);
    } else if (searchType == 'blogDepartments') {
      searchBlogDepartments(blogDepartmentName: dataName, departmentId: id!);
    } else if (searchType == 'postDepartments') {
      searchPostDepartments(postDepartmentName: dataName, departmentId: id!);
    } else if (searchType == 'clinicDepartments') {
      searchClinicDepartments(
          clinicDepartmentName: dataName, idDepartment: id!);
    }
  }

  Widget searchDataResultDepartments(
      {required SearchDepartments searchDepartments,
      required GetClinicsById getClinicsById,
      required context,
      required index}) {
    return CustomClinicsList(
      clinicsList: getClinicsById.data!,
      id: getClinicsById.data![index].id!,
      name: searchDepartments.data![index].name!,
      seeAllFunc: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SingleDepartment(
                id: searchDepartments.data![index].id!,
                departmentName: searchDepartments.data![index].name!)));
      },
    );
  }

  Widget searchDataResultDoctors(
      {required SearchDoctors searchDoctors,
      required context,
      required index}) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SingleDoctor(
                    id: searchDoctors.data![index].id!,
                  )));
        },
        child: DoctorCard(
          clinic: searchDoctors.data![index].clinicName!,
          name: searchDoctors.data![index].name!,
          years: searchDoctors.data![index].previousExperience ?? 0,
        ));
  }

  Widget searchDataResultComplaints(
      {required SearchComplaints searchComplaints,
      required context,
      required index}) {
    return ComplaintCard(
      title: searchComplaints.data![index].title!,
      content: searchComplaints.data![index].content!,
      status: searchComplaints.data![index].statues!,
      time: searchComplaints.data![index].hoursAgo!,
    );
  }

  Widget searchDataResultBlogDepartments(
      {required SearchBlogDepartments searchBlogDepartments,
      required context,
      required index}) {
    return DepartmentCard(
        name: searchBlogDepartments.data![index].name!,
        id: searchBlogDepartments.data![index].id!);
  }

  Widget searchDataResultPostDepartments(
      {required SearchPostDepartments searchPostDepartments,
      required context,
      required index}) {
    return PostCard(
      title: searchPostDepartments.data![index].postTitle!,
      image: searchPostDepartments.data![index].image!,
      date: searchPostDepartments.data![index].postDate!,
      likeNum: searchPostDepartments.data![index].likes!,
      publisher: searchPostDepartments.data![index].publisherName!,
      viewNum: searchPostDepartments.data![index].views!,
    );
  }

  Widget searchDataResultClinicDepartments(
      {required SearchClinicDepartments searchClinicDepartments,
      required context,
      required index}) {
    return ClinicCard(
        sessionPriceSingleClinic:
            searchClinicDepartments.data![index].sessionPrice!,
        doctorsCount: searchClinicDepartments.data![index].doctorsCount!,
        idSingleClinic: searchClinicDepartments.data![index].id!,
        nameSingleClinic: searchClinicDepartments.data![index].name!);
  }

  void searchDepartments({
    required String departmentName,
  }) {
    emit(SearchDepartmentsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(
            url: searchDepartmentsUrl,
            data: {'input': departmentName},
            token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late SearchDepartments searchDepartments;
        searchDepartments = SearchDepartments.fromJson(response.data);
        if (searchDepartments.data != null) {
          for (int i = 0; i < searchDepartments.data!.length; i++) {
            getClinicsById(searchDepartments.data![i].id!);
          }
        }
        emit(SearchDepartmentsSuccessState(searchDepartments));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SearchDepartmentsErrorState(errorModel));
      } else {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void searchDoctors({
    required String doctorName,
  }) {
    emit(SearchDoctorsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(
            url: searchDoctorsUrl, data: {'input': doctorName}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late SearchDoctors searchDoctors;
        searchDoctors = SearchDoctors.fromJson(response.data);
        emit(SearchDoctorsSuccessState(searchDoctors));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SearchDoctorsErrorState(errorModel));
      } else {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void searchComplaints({
    required String complaintName,
  }) {
    emit(SearchComplaintsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(
            url: searchComplaintsUrl,
            data: {'input': complaintName},
            token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late SearchComplaints searchComplaints;
        searchComplaints = SearchComplaints.fromJson(response.data);
        emit(SearchComplaintsSuccessState(searchComplaints));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SearchComplaintsErrorState(errorModel));
      } else {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void searchBlogDepartments({
    required String blogDepartmentName,
    required int departmentId,
  }) {
    emit(SearchBlogDepartmentsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(
            url: searchBlogDepartmentsUrl,
            data: {'input': blogDepartmentName, 'department': departmentId},
            token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late SearchBlogDepartments searchBlogDepartments;
        searchBlogDepartments = SearchBlogDepartments.fromJson(response.data);
        emit(SearchBlogDepartmentsSuccessState(searchBlogDepartments));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SearchBlogDepartmentsErrorState(errorModel));
      } else {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void searchPostDepartments({
    required String postDepartmentName,
    required int departmentId,
  }) {
    emit(SearchPostDepartmentsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(
            url: searchPostDepartmentsUrl,
            data: {'input': postDepartmentName, 'department': departmentId},
            token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late SearchPostDepartments searchPostDepartments;
        searchPostDepartments = SearchPostDepartments.fromJson(response.data);
        emit(SearchPostDepartmentsSuccessState(searchPostDepartments));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SearchPostDepartmentsErrorState(errorModel));
      } else {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void searchClinicDepartments({
    required String clinicDepartmentName,
    required int idDepartment,
  }) {
    emit(SearchClinicDepartmentsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(
            url: searchClinicDepartmentsUrl,
            data: {
              'input': clinicDepartmentName,
              'department_id': idDepartment
            },
            token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late SearchClinicDepartments searchClinicDepartments;
        searchClinicDepartments =
            SearchClinicDepartments.fromJson(response.data);
        emit(SearchClinicDepartmentsSuccessState(searchClinicDepartments));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SearchClinicDepartmentsErrorState(errorModel));
      } else {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  void getClinicsById(int id) {
    emit(SearchDepartmentsGetClinicsByIdLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getClinicsByIdUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetClinicsById getClinicsById;
        getClinicsById = GetClinicsById.fromJson(response.data);
        emit(SearchDepartmentsGetClinicsByIdSuccessState(getClinicsById));
      }
      if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SearchDepartmentsGetClinicsByIdErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }
}
