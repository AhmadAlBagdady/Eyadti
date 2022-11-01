import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/models/clinic/search_clinic_departments.dart';
import 'package:departments/models/complaints/search_complaints.dart';
import 'package:departments/models/department/search_departments.dart';
import 'package:departments/models/doctor/search_doctors.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/search_blog_departments.dart';
import 'package:departments/models/news/search_post_departments.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchDepartmentsSuccessState extends SearchState {
  final SearchDepartments searchDepartments;
  SearchDepartmentsSuccessState(this.searchDepartments);
}

class SearchDepartmentsErrorState extends SearchState {
  final ErrorModel errorModel;
  SearchDepartmentsErrorState(this.errorModel);
}

class SearchDepartmentsLoadingState extends SearchState {}

class SearchDepartmentsGetClinicsByIdSuccessState extends SearchState {
  final GetClinicsById getClinicsById;

  SearchDepartmentsGetClinicsByIdSuccessState(this.getClinicsById);
}

class SearchDepartmentsGetClinicsByIdErrorState extends SearchState {
  final ErrorModel errorModel;
  SearchDepartmentsGetClinicsByIdErrorState(this.errorModel);
}

class SearchDepartmentsGetClinicsByIdLoadingState extends SearchState {}

class SearchDoctorsSuccessState extends SearchState {
  final SearchDoctors searchDoctors;
  SearchDoctorsSuccessState(this.searchDoctors);
}

class SearchDoctorsErrorState extends SearchState {
  final ErrorModel errorModel;
  SearchDoctorsErrorState(this.errorModel);
}

class SearchDoctorsLoadingState extends SearchState {}

class SearchComplaintsSuccessState extends SearchState {
  final SearchComplaints searchComplaints;
  SearchComplaintsSuccessState(this.searchComplaints);
}

class SearchComplaintsErrorState extends SearchState {
  final ErrorModel errorModel;
  SearchComplaintsErrorState(this.errorModel);
}

class SearchComplaintsLoadingState extends SearchState {}

class SearchBlogDepartmentsSuccessState extends SearchState {
  final SearchBlogDepartments searchBlogDepartments;
  SearchBlogDepartmentsSuccessState(this.searchBlogDepartments);
}

class SearchBlogDepartmentsErrorState extends SearchState {
  final ErrorModel errorModel;
  SearchBlogDepartmentsErrorState(this.errorModel);
}

class SearchBlogDepartmentsLoadingState extends SearchState {}

class SearchClinicDepartmentsSuccessState extends SearchState {
  final SearchClinicDepartments searchClinicDepartments;
  SearchClinicDepartmentsSuccessState(this.searchClinicDepartments);
}

class SearchClinicDepartmentsErrorState extends SearchState {
  final ErrorModel errorModel;
  SearchClinicDepartmentsErrorState(this.errorModel);
}

class SearchClinicDepartmentsLoadingState extends SearchState {}

class SearchPostDepartmentsSuccessState extends SearchState {
  final SearchPostDepartments searchPostDepartments;
  SearchPostDepartmentsSuccessState(this.searchPostDepartments);
}

class SearchPostDepartmentsErrorState extends SearchState {
  final ErrorModel errorModel;
  SearchPostDepartmentsErrorState(this.errorModel);
}

class SearchPostDepartmentsLoadingState extends SearchState {}
