class GetLastPatient {
  String? message;
  Data? data;

  GetLastPatient({this.message, this.data});

  GetLastPatient.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }
}

class Data {
  int? patientId;
  String? patientName;
  int? age;
  String? phone;
  int? waitingId;
  Data(
      {this.patientId, this.patientName, this.age, this.phone, this.waitingId});

  Data.fromJson(Map<String, dynamic> json) {
    waitingId = json['waiting_id'] as int?;
    patientId = json['patient_id'] as int?;
    patientName = json['patient_name'] as String?;
    age = json['Age'] as int?;
    phone = json['phone_number'] as String?;
  }
}
