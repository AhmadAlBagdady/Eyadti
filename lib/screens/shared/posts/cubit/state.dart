import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/delete_post.dart';
import 'package:departments/models/news/get_blog_departments.dart';
import 'package:departments/models/news/get_posts_by_id.dart';

abstract class PostsState {}

class PostsInitialState extends PostsState {}

class PostsGetPostsSuccessState extends PostsState {
  final GetPostsById getPosts;
  PostsGetPostsSuccessState(this.getPosts);
}

class PostsGetPostsErrorState extends PostsState {
  final ErrorModel errorModel;
  PostsGetPostsErrorState(this.errorModel);
}

class PostsGetPostsLoadingState extends PostsState {}
