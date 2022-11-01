class GetSingleClinic {
  String? message;
  List<Doctor>? data;

  GetSingleClinic({
    this.message,
    this.data,
  });

  GetSingleClinic.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as List?)?.map((dynamic e) => Doctor.fromJson(e as Map<String,dynamic>)).toList();
  }
}

class Doctor {
  int? id;
  String? name;
  dynamic previousExperience;

  Doctor({
    this.id,
    this.name,
    this.previousExperience,
  });

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    previousExperience = json['previous_experience'];
  }

}