class GetAvailableTime{
  String? message;
  List<dynamic>? data;

  GetAvailableTime.fromJson(Map<String,dynamic> json){
    message = json['message'] as String?;
    data = json['data'] as List <dynamic>?;
  }
}