class GetAllDoctors {
  String? message;
  List<Doctor>? data;

  GetAllDoctors({
    this.message,
    this.data,
  });

  GetAllDoctors.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as List?)?.map((dynamic e) => Doctor.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Doctor {
  int? id;
  String? name;
  dynamic previousExperience;
  String? clinicName;

  Doctor({
    this.id,
    this.name,
    this.previousExperience,
    this.clinicName,
  });

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    previousExperience = json['previous_experience'];
    clinicName = json['clinic_name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['previous_experience'] = previousExperience;
    json['clinic_name'] = clinicName;
    return json;
  }
}