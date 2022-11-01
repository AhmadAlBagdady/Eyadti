class ErrorModel{
  final String? message;

  ErrorModel(this.message);

  ErrorModel.fromJson(Map<String,dynamic> json)
  : message = json['message'];
}