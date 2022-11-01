class ChangeLanguage {
  final String? message;
  final String? data;

  ChangeLanguage({
    this.message,
    this.data,
  });

  ChangeLanguage.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
