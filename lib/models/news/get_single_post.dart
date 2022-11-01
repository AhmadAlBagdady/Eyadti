class GetSinglePost {
  String? message;
  Content? data;

  GetSinglePost({
    this.message,
    this.data,
  });

  GetSinglePost.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as Map<String,dynamic>?) != null ? Content.fromJson(json['data'] as Map<String,dynamic>) : null;
  }
}

class Content {
  String? content;

  Content({
    this.content,
  });

  Content.fromJson(Map<String, dynamic> json) {
    content = json['content'] as String?;
  }
}