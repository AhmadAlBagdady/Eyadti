import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/models/department/get_all_departments.dart';
import 'package:departments/models/department/search_departments.dart';
import 'package:departments/models/doctor/get_all_doctors.dart';
import 'package:departments/models/error%20model/error_model.dart';

abstract class DepartmentsState {}

class DepartmentsInitialState extends DepartmentsState {}

class DepartmentsGetAllDepartmentsSuccessState extends DepartmentsState {
  final GetDepartments getDepartments;
  final int status;
  DepartmentsGetAllDepartmentsSuccessState(this.getDepartments, this.status);
}

class DepartmentsGetAllDepartmentsErrorState extends DepartmentsState {
  final ErrorModel errorModel;
  DepartmentsGetAllDepartmentsErrorState(this.errorModel);
}

class DepartmentsGetAllDepartmentsLoadingState extends DepartmentsState {}

class DepartmentsGetClinicsByIdSuccessState extends DepartmentsState {
  final GetClinicsById getClinicsById;
  final int status;
  DepartmentsGetClinicsByIdSuccessState(this.getClinicsById, this.status);
}

class DepartmentsGetClinicsByIdErrorState extends DepartmentsState {
  final ErrorModel errorModel;
  DepartmentsGetClinicsByIdErrorState(this.errorModel);
}

class DepartmentsGetClinicsByIdLoadingState extends DepartmentsState {}

class DepartmentsGetAllSuccessState extends DepartmentsState {
  final List<GetClinicsById> list;
  final GetDepartments getDepartments;
  final int status;
  DepartmentsGetAllSuccessState(this.list, this.getDepartments, this.status);
}

class DepartmentsGetAllErrorState extends DepartmentsState {
  final ErrorModel errorModel;
  DepartmentsGetAllErrorState(this.errorModel);
}

class DepartmentsGetAllLoadingState extends DepartmentsState {}
