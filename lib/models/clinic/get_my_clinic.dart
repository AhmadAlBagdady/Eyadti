class GetMyClinic {
  String? message;
  Data? data;

  GetMyClinic({this.message, this.data});

  GetMyClinic.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }
}

class Data {
  int? sessionPrice;
  List<Doctors>? listOfDoctors;
  List<Nurses>? listOfNurses;

  Data({this.sessionPrice, this.listOfDoctors, this.listOfNurses});

  Data.fromJson(Map<String, dynamic> json) {
    sessionPrice = json['session_price'];
    listOfDoctors = (json['doctors'] as List?)
        ?.map((dynamic e) => Doctors.fromJson(e as Map<String, dynamic>))
        .toList();
    listOfNurses = (json['nurses'] as List?)
        ?.map((dynamic e) => Nurses.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['session_price'] = sessionPrice;
    json['doctors'] = listOfDoctors?.map((e) => e.toJson()).toList();
    json['nurses'] = listOfNurses?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Doctors {
  int? id;
  String? name;
  String? clinicName;
  int? previousExperience;

  Doctors({this.id, this.name, this.clinicName, this.previousExperience});

  Doctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    clinicName = json['clinic_name'];
    previousExperience = json['previous_experience'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['clinic_name'] = clinicName;
    json['previous_experience'] = previousExperience;
    return json;
  }
}

class Nurses {
  int? id;
  String? name;
  String? clinicName;
  int? previousExperience;

  Nurses({this.id, this.name, this.clinicName, this.previousExperience});

  Nurses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    clinicName = json['clinic_name'];
    previousExperience = json['previous_experience'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['clinic_name'] = clinicName;
    json['previous_experience'] = previousExperience;
    return json;
  }
}
