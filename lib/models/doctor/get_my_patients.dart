class GetMyPatients {
  String? message;
  List<Patients>? patients;

  GetMyPatients({this.message, this.patients});

  GetMyPatients.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    patients = (json['data'] as List?)
        ?.map((dynamic e) => Patients.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class Patients {
  int? id;
  String? name;
  int? age;
  String? phoneNumber;
  int? appointmentsCount;

  Patients(
      {this.id, this.name, this.age, this.phoneNumber, this.appointmentsCount});

  Patients.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    age = json['age'] as int?;
    phoneNumber = json['phone_number'] as String?;
    appointmentsCount = json['appointments_count'] as int?;
  }
}
