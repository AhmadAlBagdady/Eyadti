class SearchPostDepartments {
  String? message;
  List<PostDepartments>? data;

  SearchPostDepartments({
    this.message,
    this.data,
  });

  SearchPostDepartments.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as List?)
        ?.map(
            (dynamic e) => PostDepartments.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class PostDepartments {
  int? id;
  String? publisherName;
  String? postTitle;
  String? image;
  String? postDate;
  int? likes;
  int? views;
  bool? isLike;
  PostDepartments(
      {this.id,
      this.publisherName,
      this.postTitle,
      this.image,
      this.postDate,
      this.likes,
      this.views,
      this.isLike});

  PostDepartments.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    publisherName = json['publisher_name'] as String?;
    postTitle = json['post_title'] as String?;
    image = json['image'] as String?;
    postDate = json['post_date'] as String?;
    likes = json['likes'] as int?;
    views = json['views'] as int?;
    isLike = json['is_like'] as bool?;
  }
}
