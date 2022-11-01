class SetRatingDoctorById {
  final String? message;
  final String? data;

  SetRatingDoctorById({
    this.message,
    this.data,
  });

  SetRatingDoctorById.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
