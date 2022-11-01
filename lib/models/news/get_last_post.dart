class GetLastPost {
  String? message;
  Post? data;

  GetLastPost({
    this.message,
    this.data,
  });

  GetLastPost.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as Map<String,dynamic>?) != null ? Post.fromJson(json['data'] as Map<String,dynamic>) : null;
  }
}

class Post {
  String? departmentName;
  int? id;
  String? publisherName;
  String? postTitle;
  dynamic image;
  String? postDate;
  int? likes;
  int? views;
  bool? isLike;

  Post({
    this.departmentName,
    this.id,
    this.publisherName,
    this.postTitle,
    this.image,
    this.postDate,
    this.likes,
    this.views,
    this.isLike,
  });

  Post.fromJson(Map<String, dynamic> json) {
    departmentName = json['department_name'] as String?;
    id = json['id'] as int?;
    publisherName = json['publisher_name'] as String?;
    postTitle = json['post_title'] as String?;
    image = json['image'];
    postDate = json['post_date'] as String?;
    likes = json['likes'] as int?;
    views = json['views'] as int?;
    isLike = json['is_like'] as bool?;
  }
}