class EditProfileModel {
  String? message;
  String? data;

  EditProfileModel({
    this.message,
    this.data,
  });

  EditProfileModel.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
