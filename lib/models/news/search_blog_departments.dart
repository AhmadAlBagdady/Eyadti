class SearchBlogDepartments {
  String? message;
  List<BlogDepartments>? data;

  SearchBlogDepartments({
    this.message,
    this.data,
  });

  SearchBlogDepartments.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as List?)
        ?.map(
            (dynamic e) => BlogDepartments.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class BlogDepartments {
  int? id;
  String? name;

  BlogDepartments({
    this.id,
    this.name,
  });

  BlogDepartments.fromJson(Map<String, dynamic> json) {
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
