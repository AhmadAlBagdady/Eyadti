import 'dart:io';

import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/delete_post.dart';
import 'package:departments/models/news/edit_post.dart';
import 'package:departments/models/news/get_my_posts.dart';
import 'package:departments/screens/doctor/my%20posts/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPostsCubit extends Cubit<MyPostsState> {
  MyPostsCubit() : super(MyPostsInitialState());
  static MyPostsCubit get(context) => BlocProvider.of(context);

  var listKey = GlobalKey<State>();

  File? image;

  void changeImage(i) {
    image = i;
  }

  var titleController = TextEditingController();
  var contentController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void getMyPosts() {
    emit(MyPostsGetMyPostsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: getMyPostsUrl, token: token).then((response) {
      if (response.statusCode! < 300) {
        late GetMyPosts getMyPosts;
        getMyPosts = GetMyPosts.fromJson(response.data);
        List<bool> thisCardBe = List.filled(
            getMyPosts.data == null ? 0 : getMyPosts.data!.length, true);
        emit(MyPostsGetMyPostsSuccessState(getMyPosts, thisCardBe));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(MyPostsGetMyPostsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }

  void deletePost({
    required int id,
  }) {
    emit(MyPostsDeletePostLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: deletePostUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late DeletePost deletePost;
        deletePost = DeletePost.fromJson(response.data);
        emit(MyPostsDeletePostSuccessState(deletePost));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(MyPostsDeletePostErrorState(errorModel));
      } else {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }

  void editPost({
    required int id,
  }) {
    emit(MyPostsEditPostLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: editPostUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late EditPost editPost;
        editPost = EditPost.fromJson(response.data);
        emit(MyPostsEditPostSuccessState(editPost));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(MyPostsEditPostErrorState(errorModel));
      } else {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
