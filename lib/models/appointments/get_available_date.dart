class GetAvailableDate{
  String ? message;
  List<dynamic> ?data;

  GetAvailableDate.fromJson(Map<String,dynamic> json){
    message = json['message'] as String?;
    data = json ['data']as List<dynamic>?;
  }
}