import 'package:departments/models/error%20model/error_model.dart';

abstract class AddPostState {}

class AddPostInitialState extends AddPostState {}

class AddPostChangeSelectedItem extends AddPostState {}

class AddPostAddImageState extends AddPostState {}

class AddPostSuccessState extends AddPostState {}

class AddPostErrorState extends AddPostState {
  final ErrorModel errorModel;

  AddPostErrorState(this.errorModel);
}

class AddPostLoadingState extends AddPostState {}
