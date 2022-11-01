import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/delete_post.dart';
import 'package:departments/models/news/edit_post.dart';
import 'package:departments/models/news/get_my_posts.dart';

abstract class MyPostsState {}

class MyPostsInitialState extends MyPostsState {}

class MyPostsGetMyPostsSuccessState extends MyPostsState {
  final GetMyPosts getMyPosts;
  final List<bool> thisCardBe;
  MyPostsGetMyPostsSuccessState(this.getMyPosts, this.thisCardBe);
}

class MyPostsGetMyPostsErrorState extends MyPostsState {
  final ErrorModel errorModel;
  MyPostsGetMyPostsErrorState(this.errorModel);
}

class MyPostsGetMyPostsLoadingState extends MyPostsState {}

class MyPostsDeletePostSuccessState extends MyPostsState {
  final DeletePost deletePost;
  MyPostsDeletePostSuccessState(this.deletePost);
}

class MyPostsDeletePostLoadingState extends MyPostsState {}

class MyPostsDeletePostErrorState extends MyPostsState {
  final ErrorModel errorModel;
  MyPostsDeletePostErrorState(this.errorModel);
}

class MyPostsEditPostSuccessState extends MyPostsState {
  final EditPost editPost;
  MyPostsEditPostSuccessState(this.editPost);
}

class MyPostsEditPostLoadingState extends MyPostsState {}

class MyPostsEditPostErrorState extends MyPostsState {
  final ErrorModel errorModel;
  MyPostsEditPostErrorState(this.errorModel);
}
