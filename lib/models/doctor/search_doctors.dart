class SearchDoctors {
  String? message;
  List<Doctor>? data;

  SearchDoctors({
    this.message,
    this.data,
  });

  SearchDoctors.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as List?)
        ?.map((dynamic e) => Doctor.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class Doctor {
  int? id;
  String? name;
  int? previousExperience;
  String? clinicName;

  Doctor({this.id, this.name, this.previousExperience, this.clinicName});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['doctor_id'] as int?;
    name = json['name'] as String?;
    previousExperience = json['previous_experience'] as int?;
    clinicName = json['clinic_name'] as String?;
  }
}
