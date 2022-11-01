class GetAllNotifications {
  final String? message;
  final List<Notif>? data;

  GetAllNotifications({
    this.message,
    this.data,
  });

  GetAllNotifications.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = (json['data'] as List?)
            ?.map((dynamic e) => Notif.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'message': message, 'data': data?.map((e) => e.toJson()).toList()};
}

class Notif {
  final int? id;
  final String? title;
  final String? senderName;
  final int? hoursAgo;

  Notif({
    this.id,
    this.title,
    this.senderName,
    this.hoursAgo,
  });

  Notif.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        senderName = json['sender_name'],
        hoursAgo = json['hours_ago'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'sender_name': senderName,
        'hours_ago': hoursAgo
      };
}
