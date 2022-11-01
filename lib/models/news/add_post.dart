import 'dart:io';

class AddPostModel{
  final String title;
  final String body;
  final File image;
  final String message;

  AddPostModel(this.title, this.body, this.image, this.message);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['post_subject'] = title;
    json['body'] = body;
    json['image'] = image;
    return json;
  }

}