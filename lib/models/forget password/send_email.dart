class SendEmail {
  final String? message;
  final String? data;

  SendEmail({
    this.message,
    this.data,
  });

  SendEmail.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
