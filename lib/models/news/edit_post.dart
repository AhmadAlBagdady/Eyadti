class EditPost {
  final String? message;
  final String? data;

  EditPost({
    this.message,
    this.data,
  });

  EditPost.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
