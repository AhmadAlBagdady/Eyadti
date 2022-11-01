class GetGeneralProfile {
  String? message;
  Data? data;

  GetGeneralProfile({
    this.message,
    this.data,
  });

  GetGeneralProfile.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }
}

class Data {
  dynamic email;
  int? gender;
  int? age;
  String? birthDate;
  String? firstName;
  String? fatherName;
  String? lastName;
  List<Phones>? phones;

  Data({
    this.email,
    this.gender,
    this.age,
    this.birthDate,
    this.firstName,
    this.fatherName,
    this.lastName,
    this.phones,
  });

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    gender = json['gender'] as int?;
    age = json['age'] as int?;
    birthDate = json['birth_date'] as String?;
    firstName = json['first_name'] as String?;
    fatherName = json['father_name'] as String?;
    lastName = json['last_name'] as String?;
    phones = (json['data'] as List?)
        ?.map((dynamic e) => Phones.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class Phones {
  int? phoneId;
  String? phoneNumber;

  Phones({this.phoneId, this.phoneNumber});

  Phones.fromJson(Map<String, dynamic> json) {
    phoneId = json['phone_id'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['phone_id'] = phoneId;
    json['phone_number'] = phoneNumber;
    return json;
  }
}
