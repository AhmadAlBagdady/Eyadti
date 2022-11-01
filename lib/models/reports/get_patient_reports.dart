class GetPatientReports {
  String? message;
  List<Data>? data;

  GetPatientReports({
    this.message,
    this.data,
  });

  GetPatientReports.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();
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
  String? doctorName;
  String? date;
  String? time;
  int? isReview;
  String? statue;

  Data({
    this.id,
    this.doctorName,
    this.date,
    this.time,
    this.isReview,
    this.statue,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    doctorName = json['doctor_name'] as String?;
    date = json['date'] as String?;
    time = json['time'] as String?;
    isReview = json['is_review'] as int?;
    statue = json['statue'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['doctor_name'] = doctorName;
    json['date'] = date;
    json['time'] = time;
    json['is_review'] = isReview;
    json['statue'] = statue;
    return json;
  }
}