class DeleteAppointment {
  final String? message;
  final String? data;

  DeleteAppointment({
    this.message,
    this.data,
  });

  DeleteAppointment.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
