class GetBlogDepartments {
  String? message;
  List<BlogDepartment>? data;

  GetBlogDepartments({
    this.message,
    this.data,
  });

  GetBlogDepartments.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as List?)?.map((dynamic e) => BlogDepartment.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class BlogDepartment {
  int? id;
  String? name;

  BlogDepartment({
    this.id,
    this.name,
  });

  BlogDepartment.fromJson(Map<String, dynamic> json) {
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