import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/delete_post.dart';
import 'package:departments/models/news/get_blog_departments.dart';
import 'package:departments/models/news/get_posts_by_id.dart';
import 'package:departments/models/news/get_single_post.dart';
import 'package:departments/models/news/put_like.dart';

abstract class SinglePostState {}

class SinglePostInitialState extends SinglePostState {}

class SinglePostPutLikeSuccessState extends SinglePostState {
  final PutLike putLike;
  SinglePostPutLikeSuccessState(this.putLike);
}

class SinglePostPutLikeErrorState extends SinglePostState {
  final ErrorModel errorModel;
  SinglePostPutLikeErrorState(this.errorModel);
}

class SinglePostGetSinglePostSuccessState extends SinglePostState {
  final GetSinglePost getSinglePost;
  SinglePostGetSinglePostSuccessState(this.getSinglePost);
}

class SinglePostGetSinglePostErrorState extends SinglePostState {
  final ErrorModel errorModel;
  SinglePostGetSinglePostErrorState(this.errorModel);
}
