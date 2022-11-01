class DeletePost {
  final String? message;
  final String? data;

  DeletePost({
    this.message,
    this.data,
  });

  DeletePost.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
