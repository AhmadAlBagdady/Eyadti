class LoginModel {
  String? message;
  Data? data;

  LoginModel({
    this.message,
    this.data,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    json['data'] = data?.toJson();
    return json;
  }
}

class Data {
  String? accessToken;
  List<String>? roles;
  String? name;
  String? userName;
  String? lang;
  Data({this.accessToken, this.roles, this.name, this.userName, this.lang});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'] as String?;
    roles = (json['roles'] as List?)?.map((dynamic e) => e as String).toList();
    name = json['name'] as String?;
    userName = json['username'] as String?;
    lang = json['lang'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['accessToken'] = accessToken;
    json['roles'] = roles;
    json['name'] = name;
    json['username'] = userName;
    json['lang'] = lang;
    return json;
  }
}
