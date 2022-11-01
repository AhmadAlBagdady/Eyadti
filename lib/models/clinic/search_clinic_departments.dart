class SearchClinicDepartments {
  String? message;
  List<Clinic>? data;

  SearchClinicDepartments({
    this.message,
    this.data,
  });

  SearchClinicDepartments.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as List?)
        ?.map((dynamic e) => Clinic.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class Clinic {
  int? id;
  String? name;
  int? sessionPrice;
  int? doctorsCount;

  Clinic({this.id, this.name, this.sessionPrice, this.doctorsCount});

  Clinic.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    sessionPrice = json['session_price'] as int?;
    doctorsCount = json['doctors_count'] as int?;
  }
}
