class GetCalender{
  String? message;
  List<dynamic>? data;

  GetCalender.fromJson(Map<String,dynamic> json):
      message = json['message'] as String?,
      data = json['data'] as List<dynamic>?;
}