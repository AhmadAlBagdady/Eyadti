class GetLastComplaint {
  String? message;
  Data? data;

  GetLastComplaint({this.message, this.data});

  GetLastComplaint.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }
}

class Data {
  String? title;
  String? content;
  int? statues;
  int? hoursAgo;

  Data({this.title, this.content, this.statues, this.hoursAgo});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String?;
    content = json['content'] as String?;
    statues = json['statues'] as int?;
    hoursAgo = json['hours_ago'] as int?;
  }
}
