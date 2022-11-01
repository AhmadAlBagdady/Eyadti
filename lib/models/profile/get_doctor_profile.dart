class GetDoctorProfile {
  String? message;
  Data? data;

  GetDoctorProfile({
    this.message,
    this.data,
  });

  GetDoctorProfile.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }
}

class Data {
  int? previousExperience;
  String? sessionDuration;
  double? salaryRate;
  int? salary;
  String? clinicName;

  Data({
    this.previousExperience,
    this.sessionDuration,
    this.salaryRate,
    this.salary,
    this.clinicName,
  });

  Data.fromJson(Map<String, dynamic> json) {
    previousExperience = json['previous_experience'] as int?;
    sessionDuration = json['session_duration'] as String?;
    salaryRate = json['salary_rate'] as double?;
    salary = json['salary'] as int?;
    clinicName = json['clinic_name'] as String?;
  }
}
