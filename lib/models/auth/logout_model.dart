class LogoutModel{
  final String? message;

  LogoutModel(this.message);

  LogoutModel.fromJson(Map<String,dynamic> json)
      : message = json['message'];
}