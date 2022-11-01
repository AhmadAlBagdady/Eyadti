class GetDoctorById {
  String? message;
  Data? data;

  GetDoctorById({this.message, this.data});

  GetDoctorById.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }
}

class Data {
  String? doctorName;
  String? clinicName;
  List<Phones>? phones;
  int? previousExperience;
  int? patientCount;
  int? appointmentCount;
  int? age;
  int? gender;
  String? image;

  Data(
      {this.doctorName,
      this.age,
      this.previousExperience,
      this.clinicName,
      this.gender,
      this.phones,
      this.image,
      this.appointmentCount,
      this.patientCount});

  Data.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctor_name'] as String?;
    clinicName = json['clinic_name'] as String?;
    phones = (json['phones'] as List?)
        ?.map((dynamic e) => Phones.fromJson(e as Map<String, dynamic>))
        .toList();
    previousExperience = json['previous_experience'] as int?;
    patientCount = json['patient_count'] as int?;
    appointmentCount = json['appointment_count'] as int?;
    age = json['age'] as int?;
    gender = json['gender'] as int?;
    image = json['image'] as String?;
  }
}

class Phones {
  int? phoneId;
  String? phoneNumber;

  Phones({this.phoneId, this.phoneNumber});

  Phones.fromJson(Map<String, dynamic> json) {
    phoneId = json['phone_id'] as int?;
    phoneNumber = json['phone_number'] as String?;
  }
}
