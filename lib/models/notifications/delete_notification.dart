class DeleteNotification {
  final String? message;
  final String? data;

  DeleteNotification({
    this.message,
    this.data,
  });

  DeleteNotification.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
