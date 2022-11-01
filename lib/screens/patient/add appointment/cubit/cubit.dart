import 'package:departments/models/appointments/book_appointment.dart';
import 'package:departments/models/appointments/get_available_time.dart';
import 'package:departments/models/appointments/get_available_date.dart';
import 'package:departments/models/clinic/get_clinics_by_id.dart';
import 'package:departments/models/clinic/get_single_clinic.dart';
import 'package:departments/models/department/get_all_departments.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/screens/patient/add%20appointment/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddAppointCubit extends Cubit<AddAppointState> {
  AddAppointCubit() : super(AddAppointInitialState());

  static AddAppointCubit get(context) => BlocProvider.of(context);

  String? selectedDep;

  String? selectedClinic;

  String? selectedDoc;

  DateTime? selectedDate;

  bool isSelectDep = true;
  bool isSelectClinic = false;
  bool isSelectDoctor = false;
  bool isSelectDate = false;

  int? availableTimeSelect;
  String? availableTime;

  void changeSelectAvailableTime(int index, String value) {
    availableTimeSelect = index;
    availableTime = value;
    emit(AddAppointChangeSelectedItem());
  }

  void changeSelectedItem(String type, value) {
    type == 'Department'
        ? selectedDep = value
        : type == 'Clinic'
            ? selectedClinic = value
            : type == 'Doctor'
                ? selectedDoc = value
                : selectedDate = value;
    emit(AddAppointChangeSelectedItem());
  }

  void getDepartments() {
    emit(AddAppointmentGetDepartmentsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getAllDepartmentsUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetDepartments allDepartments;
        allDepartments = GetDepartments.fromJson(response.data);
        emit(AddAppointmentGetDepartmentsSuccessState(allDepartments));
      } else if (response.statusCode! < 500 && response.statusCode! >= 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(AddAppointmentGetDepartmentsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }

  void getClinicsByDepartmentId(int id) {
    emit(AddAppointmentGetDepartmentsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getClinicsByIdUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetClinicsById getClinicsById;
        getClinicsById = GetClinicsById.fromJson(response.data);
        emit(AddAppointmentGetClinicsByIdSuccessState(getClinicsById));
      }
      if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(AddAppointmentGetClinicsByIdErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }

  void getSingleClinic(int id) {
    emit(AddAppointmentGetSingleClinicLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getSingleClinicUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetSingleClinic getSingleClinic;
        getSingleClinic = GetSingleClinic.fromJson(response.data);
        emit(AddAppointmentGetSingleClinicSuccessState(getSingleClinic));
      }
      if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(AddAppointmentGetSingleClinicErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }

  void getAvailableTime(String date, int id) {
    emit(AddAppointmentGetAvailableTimeLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.postData(
        url: getAvailableTimeUrl,
        token: token,
        data: {'date': date, 'doctor_id': id}).then((response) {
      if (response.statusCode! < 300 && response.statusCode! != 204) {
        late GetAvailableTime getAvailableTime;
        getAvailableTime = GetAvailableTime.fromJson(response.data);
        emit(AddAppointmentGetAvailableTimeSuccessState(getAvailableTime));
      } else if (response.statusCode! == 204) {
        showToast(msg: 'no found any date', color: red);
      } else if (response.statusCode! > 300 && response.statusCode! < 500) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(AddAppointmentGetAvailableTimeErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }

  void getAvailableDate(int id) {
    print(id);
    emit(AddAppointmentGetAvailableDateLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.postData(
        url: getAvailableDateUrl,
        token: token,
        data: {'doctor_id': id}).then((response) {
      if (response.statusCode! < 300 && response.statusCode! != 204) {
        late GetAvailableDate getAvailableDate;
        getAvailableDate = GetAvailableDate.fromJson(response.data);
        emit(AddAppointmentGetAvailableDateSuccessState(getAvailableDate));
      } else if (response.statusCode! == 204) {
        showToast(msg: 'not found any date', color: red);
      } else if (response.statusCode! > 300 && response.statusCode! < 500) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(AddAppointmentGetAvailableDateErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }

  void bookAppointment(int id, String date, String time, int isReview) {
    emit(AddAppointmentBookAppointmentLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.postData(url: bookAppointmentUrl, token: token, data: {
      'doctor_id': id,
      'appointment_date': date,
      'appointment_time': time,
      'is_review': isReview
    }).then((response) {
      if (response.statusCode! < 300 && response.statusCode! != 204) {
        late BookAppointment bookAppointment;
        bookAppointment = BookAppointment.fromJson(response.data);
        emit(AddAppointmentBookAppointmentSuccessState(bookAppointment));
      } else if (response.statusCode! == 204) {
        showToast(msg: 'no found any date', color: red);
      } else if (response.statusCode! > 300 && response.statusCode! < 500) {
        // late ErrorModel errorModel;
        // errorModel = ErrorModel.fromJson(response.data);
        // emit(AddAppointmentBookAppointmentErrorState(errorModel));
        showToast(msg: response.data.toString(), color: red);
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }

  Future pickDate(BuildContext context, List<DateTime> availableDateList) {
    return showDatePicker(
        selectableDayPredicate: (date) {
          if (availableDateList.contains(date)) {
            return true;
          } else {
            return false;
          }
        },
        context: context,
        initialDate: availableDateList.first,
        firstDate: availableDateList.first,
        lastDate: availableDateList.last);
  }
}
