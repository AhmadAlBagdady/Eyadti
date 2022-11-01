class SearchComplaints {
  String? message;
  List<Complaints>? data;

  SearchComplaints({
    this.message,
    this.data,
  });

  SearchComplaints.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as List?)
        ?.map((dynamic e) => Complaints.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Complaints {
  String? title;
  String? content;
  int? statues;
  int? hoursAgo;

  Complaints({this.title, this.content, this.statues, this.hoursAgo});

  Complaints.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String?;
    content = json['content'] as String?;
    statues = json['statues'] as int?;
    hoursAgo = json['hours_ago'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['content'] = content;
    json['statues'] = statues;
    json['hours_ago'] = hoursAgo;
    return json;
  }
}
