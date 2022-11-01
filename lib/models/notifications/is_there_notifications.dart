class IsThereNotifications{
  final String ? message;
  final bool? data;

  IsThereNotifications(this.message, this.data);

  IsThereNotifications.fromJson(Map<String,dynamic>json)
  : message = json['message'] as String ?,
  data = json['data'] as bool?;

  Map<String,dynamic> toJson()=> {
    'message':message,
    'data':data,
};
}