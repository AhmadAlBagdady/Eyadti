class PutLike {
  String? message;
  Like? data;

  PutLike({
    this.message,
    this.data,
  });

  PutLike.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as Map<String,dynamic>?) != null ? Like.fromJson(json['data'] as Map<String,dynamic>) : null;
  }
}

class Like {
  int? likes;

  Like({
    this.likes,
  });

  Like.fromJson(Map<String, dynamic> json) {
    likes = json['likes'] as int?;
  }

}