import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/get_blog_departments.dart';
import 'package:departments/models/news/get_posts_by_id.dart';

abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsGetBlogDepartmentsSuccessState extends NewsState {
  final GetBlogDepartments getBlogDepartments;
  NewsGetBlogDepartmentsSuccessState(this.getBlogDepartments);
}

class NewsGetBlogDepartmentsErrorState extends NewsState {
  final ErrorModel errorModel;
  NewsGetBlogDepartmentsErrorState(this.errorModel);
}

class NewsGetBlogDepartmentsLoadingState extends NewsState {}

class NewsGetPostsByIdSuccessState extends NewsState {
  final GetPostsById getPostsById;
  NewsGetPostsByIdSuccessState(this.getPostsById);
}

class NewsGetPostsByIdErrorState extends NewsState {
  final ErrorModel errorModel;
  NewsGetPostsByIdErrorState(this.errorModel);
}

class NewsGetPostsByIdLoadingState extends NewsState {}
