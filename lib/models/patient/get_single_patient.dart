class GetSinglePatient {
  GetSinglePatient({
    this.message,
    this.data,
  });
  String? message;
  Data? data;

  GetSinglePatient.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }
}

class Data {
  Data({
    this.appointmentCount,
    this.email,
    this.gender,
    this.birthDate,
    this.firstName,
    this.fatherName,
    this.lastName,
    this.phoneNumber,
    this.age,
    this.height,
    this.weight,
    this.bloodGroup,
    this.allergies,
    this.diseases,
  });
  int? appointmentCount;
  String? email;
  int? gender;
  String? birthDate;
  String? firstName;
  String? fatherName;
  String? lastName;
  String? phoneNumber;
  int? age;
  int? height;
  int? weight;
  String? bloodGroup;
  Null allergies;
  Null diseases;

  Data.fromJson(Map<String, dynamic> json) {
    appointmentCount = json['appointment_count'];
    email = null;
    gender = json['gender'];
    birthDate = json['birth_date'];
    firstName = json['first_name'];
    fatherName = null;
    lastName = json['last_name'];
    phoneNumber = null;
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
    bloodGroup = json['blood_group'];
    allergies = null;
    diseases = null;
  }
}
