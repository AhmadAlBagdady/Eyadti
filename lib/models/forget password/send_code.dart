class SendCode {
  final String? message;
  final String? data;

  SendCode({
    this.message,
    this.data,
  });

  SendCode.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
