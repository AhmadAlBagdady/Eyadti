class BookAppointment{
  String ? message;

  BookAppointment.fromJson(Map<String,dynamic>json){
    message = json['message'] as String?;
  }
}