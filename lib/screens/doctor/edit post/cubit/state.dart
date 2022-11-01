import 'dart:io';

import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/edit_post.dart';
import 'package:departments/models/news/get_single_post.dart';

abstract class EditMyPostState {}

class EditMyPostInitialState extends EditMyPostState {}

class EditMyPostSuccessState extends EditMyPostState {
  final EditPost editPost;
  EditMyPostSuccessState(this.editPost);
}

class EditMyPostLoadingState extends EditMyPostState {}

class EditMyPostErrorState extends EditMyPostState {
  late ErrorModel errorModel;
  EditMyPostErrorState(this.errorModel);
}

class EditMyPostGetSinglePostSuccessState extends EditMyPostState {
  final GetSinglePost getSinglePost;
  EditMyPostGetSinglePostSuccessState(this.getSinglePost);
}

class EditMyPostGetSinglePostLoadingState extends EditMyPostState {}

class EditMyPostGetSinglePostErrorState extends EditMyPostState {
  final ErrorModel errorModel;
  EditMyPostGetSinglePostErrorState(this.errorModel);
}

class EditMyPostEditImageSuccessState extends EditMyPostState {}
