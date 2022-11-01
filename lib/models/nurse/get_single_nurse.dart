class GetSingleNurse {
  String? message;
  Data? data;

  GetSingleNurse({this.message, this.data});

  GetSingleNurse.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = Data.fromJson(json['data']);
  }
}

class Data {
  String? nurseName;
  String? clinicName;
  String? phoneNumber;
  int? previousExperience;
  int? age;
  int? gender;

  Data(
      {this.nurseName,
      this.clinicName,
      this.phoneNumber,
      this.previousExperience,
      this.age,
      this.gender});

  Data.fromJson(Map<String, dynamic> json) {
    nurseName = json['nurse_name'] as String?;
    clinicName = json['clinic_name'] as String?;
    phoneNumber = json['phone_number'] as String?;
    previousExperience = json['previous_experience'] as int?;
    age = json['age'] as int?;
    gender = json['gender'] as int?;
  }
}
