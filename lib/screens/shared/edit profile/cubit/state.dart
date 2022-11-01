import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/get_single_post.dart';
import 'package:departments/models/profile/edit_profile.dart';

abstract class EditProfileState {}

class EditProfileInitialState extends EditProfileState {}

class EditProfileSuccessState extends EditProfileState {
  final EditProfileModel editProfileModel;
  EditProfileSuccessState(this.editProfileModel);
}

class EditProfileErrorState extends EditProfileState {
  final ErrorModel errorModel;

  EditProfileErrorState(this.errorModel);
}

class EditProfileLoadingState extends EditProfileState {}
