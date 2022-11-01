class GetDepartments {
  String? message;
  List<Department>? data;

  GetDepartments({
    this.message,
    this.data,
  });

  GetDepartments.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as List?)?.map((dynamic e) => Department.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Department {
  int? id;
  String? name;

  Department({
    this.id,
    this.name,
  });

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    return json;
  }
}