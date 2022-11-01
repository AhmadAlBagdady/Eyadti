class GetEventsByDate {
  String? message;
  List<Event>? data;

  GetEventsByDate({
    this.message,
    this.data,
  });

  GetEventsByDate.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as List?)?.map((dynamic e) => Event.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Event {
  String? name;
  String? date;
  String? time;
  int? isReview;
  String? statue;

  Event({
    this.name,
    this.date,
    this.time,
    this.isReview,
    this.statue,
  });

  Event.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    date = json['date'] as String?;
    time = json['time'] as String?;
    isReview = json['is_review'] as int?;
    statue = json['statue'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['date'] = date;
    json['time'] = time;
    json['is_review'] = isReview;
    json['statue'] = statue;
    return json;
  }
}