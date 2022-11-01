class GetDoctorAppointments {
  String? message;
  List<Data>? data;

  GetDoctorAppointments({
    this.message,
    this.data,
  });

  GetDoctorAppointments.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as List?)
        ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Data {
  int? id;
  String? patientName;
  String? date;
  String? time;
  int? isReview;
  String? statue;

  Data({
    this.id,
    this.patientName,
    this.date,
    this.time,
    this.isReview,
    this.statue,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['patient_id'] as int?;
    patientName = json['patient_name'] as String?;
    date = json['date'] as String?;
    time = json['time'] as String?;
    isReview = json['is_review'] as int?;
    statue = json['statue'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['patient_id'] = id;
    json['patient_name'] = patientName;
    json['date'] = date;
    json['time'] = time;
    json['is_review'] = isReview;
    json['statue'] = statue;
    return json;
  }
}
