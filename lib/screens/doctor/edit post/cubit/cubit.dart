import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/edit_post.dart';
import 'package:departments/models/news/get_single_post.dart';
import 'package:departments/screens/doctor/edit%20post/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditMyPostCubit extends Cubit<EditMyPostState> {
  EditMyPostCubit() : super(EditMyPostInitialState());

  static EditMyPostCubit get(context) => BlocProvider.of(context);

  void changeImage(i) {
    image = i;
    emit(EditMyPostEditImageSuccessState());
  }

  File? image;

  static String title = '';
  static String content = '';

  late var titleController = TextEditingController(text: title);
  late var contentController = TextEditingController(text: content);
  var formKey = GlobalKey<FormState>();

  Future<void> editPost(Map<String, dynamic> data, File? image) async {
    emit(EditMyPostLoadingState());
    DioHelper dioHelper = DioHelper();
    FormData formData = FormData.fromMap({
      'id': data['id'],
      'image': image == null
          ? null
          : await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').last),
      'post_subject': data['post_subject'],
      'body': data['body'],
    });
    dioHelper
        .postData(url: editPostUrl, data: formData, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late EditPost editPost;
        editPost = EditPost.fromJson(response.data);
        emit(EditMyPostSuccessState(editPost));
      } else if (response.statusCode! >= 300 && response.statusCode! < 500) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(EditMyPostErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }

  void getSinglePost(int id) {
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getSinglePostUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetSinglePost getSinglePost;
        getSinglePost = GetSinglePost.fromJson(response.data);
        emit(EditMyPostGetSinglePostSuccessState(getSinglePost));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(EditMyPostGetSinglePostErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
