import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/models/error%20model/error_model.dart';

abstract class DepartmentState{}
class DepartmentInitialState extends DepartmentState{}
class DepartmentGetClinicsByIdSuccessState extends DepartmentState{
  final GetClinicsById getClinicsById;
  final int status;
  DepartmentGetClinicsByIdSuccessState(this.getClinicsById, this.status);
}
class DepartmentGetClinicsByIdErrorState extends DepartmentState{
  final ErrorModel errorModel;

  DepartmentGetClinicsByIdErrorState(this.errorModel);
}
class DepartmentGetClinicsByIdLoadingState extends DepartmentState{

}