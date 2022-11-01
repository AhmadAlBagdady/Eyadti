class SendReport {
  String? message;
  String? data;

  SendReport({
    this.message,
    this.data,
  });

  SendReport.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
  }
  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
