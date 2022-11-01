class ResetPassword {
  final String? message;
  final String? data;

  ResetPassword({
    this.message,
    this.data,
  });

  ResetPassword.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
