

import 'package:departments/models/appointments/book_appointment.dart';
import 'package:departments/models/appointments/get_available_time.dart';
import 'package:departments/models/appointments/get_available_date.dart';
import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/models/clinic/get_single_clinic.dart';
import 'package:departments/models/department/get_all_departments.dart';
import 'package:departments/models/error%20model/error_model.dart';

abstract class AddAppointState{}

class AddAppointInitialState extends AddAppointState{
}
class AddAppointChangeSelectedItem extends AddAppointState{}

class AddAppointmentGetDepartmentsSuccessState extends AddAppointState{
  final GetDepartments getAllDepartments;
  AddAppointmentGetDepartmentsSuccessState(this.getAllDepartments);
}
class AddAppointmentGetDepartmentsErrorState extends AddAppointState{
  final ErrorModel errorModel;
  AddAppointmentGetDepartmentsErrorState(this.errorModel);
}
class AddAppointmentGetDepartmentsLoadingState extends AddAppointState{}

class AddAppointmentGetClinicsByIdSuccessState extends AddAppointState{
  final GetClinicsById getClinicsById;
  AddAppointmentGetClinicsByIdSuccessState(this.getClinicsById);
}
class AddAppointmentGetClinicsByIdErrorState extends AddAppointState{
  final ErrorModel errorModel;
  AddAppointmentGetClinicsByIdErrorState(this.errorModel);
}
class AddAppointmentGetClinicsByIdLoadingState extends AddAppointState{}

class AddAppointmentGetSingleClinicSuccessState extends AddAppointState{
  final GetSingleClinic getSingleClinic;
  AddAppointmentGetSingleClinicSuccessState(this.getSingleClinic);
}
class AddAppointmentGetSingleClinicErrorState extends AddAppointState{
  final ErrorModel errorModel;
  AddAppointmentGetSingleClinicErrorState(this.errorModel);
}
class AddAppointmentGetSingleClinicLoadingState extends AddAppointState{}

class AddAppointmentGetAvailableDateSuccessState extends AddAppointState{
  final GetAvailableDate getAvailableDate;
  AddAppointmentGetAvailableDateSuccessState(this.getAvailableDate);
}
class AddAppointmentGetAvailableDateErrorState extends AddAppointState{
  final ErrorModel errorModel;
  AddAppointmentGetAvailableDateErrorState(this.errorModel);
}
class AddAppointmentGetAvailableDateLoadingState extends AddAppointState{}

class AddAppointmentGetAvailableTimeSuccessState extends AddAppointState{
  final GetAvailableTime getAvailableTime;
  AddAppointmentGetAvailableTimeSuccessState(this.getAvailableTime);
}
class AddAppointmentGetAvailableTimeErrorState extends AddAppointState{
  final ErrorModel errorModel;
  AddAppointmentGetAvailableTimeErrorState(this.errorModel);
}
class AddAppointmentGetAvailableTimeLoadingState extends AddAppointState{}

class AddAppointmentBookAppointmentSuccessState extends AddAppointState{
  final BookAppointment bookAppointment;
  AddAppointmentBookAppointmentSuccessState(this.bookAppointment);
}
class AddAppointmentBookAppointmentErrorState extends AddAppointState{
  final ErrorModel errorModel;
  AddAppointmentBookAppointmentErrorState(this.errorModel);
}
class AddAppointmentBookAppointmentLoadingState extends AddAppointState{}