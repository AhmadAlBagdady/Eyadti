class GetPatientProfile {
  String? message;
  Data? data;

  GetPatientProfile({
    this.message,
    this.data,
  });

  GetPatientProfile.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }
}

class Data {
  int? height;
  int? weight;
  String? bloodGroup;
  List<String>? allergies;
  List<String>? diseases;

  Data({
    this.height,
    this.weight,
    this.bloodGroup,
    this.allergies,
    this.diseases,
  });

  Data.fromJson(Map<String, dynamic> json) {
    height = json['height'] as int?;
    weight = json['weight'] as int?;
    bloodGroup = json['blood_group'] as String?;
    allergies =
        (json['allergies'] as List?)?.map((dynamic e) => e as String).toList();
    diseases =
        (json['diseases'] as List?)?.map((dynamic e) => e as String).toList();
  }
}
