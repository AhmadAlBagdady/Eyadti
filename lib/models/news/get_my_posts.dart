class GetMyPosts {
  String? message;
  List<Data>? data;

  GetMyPosts({
    this.message,
    this.data,
  });

  GetMyPosts.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Data {
  int? id;
  String? publisherName;
  String? postTitle;
  String? image;
  String? postDate;
  int? likes;
  int? views;
  bool? isLike;

  Data({
    this.id,
    this.publisherName,
    this.postTitle,
    this.image,
    this.postDate,
    this.likes,
    this.views,
    this.isLike,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    publisherName = json['publisher_name'] as String?;
    postTitle = json['post_title'] as String?;
    image = json['image'] as String?;
    postDate = json['post_date'] as String?;
    likes = json['likes'] as int?;
    views = json['views'] as int?;
    isLike = json['is_like'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['publisher_name'] = publisherName;
    json['post_title'] = postTitle;
    json['image'] = image;
    json['post_date'] = postDate;
    json['likes'] = likes;
    json['views'] = views;
    json['is_like'] = isLike;
    return json;
  }
}