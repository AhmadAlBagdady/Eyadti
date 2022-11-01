class GetMyMalfunctions {
  String? message;
  List<Complaint>? data;

  GetMyMalfunctions({this.message, this.data});

  GetMyMalfunctions.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as List?)
        ?.map((dynamic e) => Complaint.fromJson(e as Map<String, dynamic>))
        .toList();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Complaint {
  String? title;
  String? content;
  int? statues;
  int? hoursAgo;

  Complaint({this.title, this.content, this.statues, this.hoursAgo});

  Complaint.fromJson(Map<String, dynamic> json) {
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
