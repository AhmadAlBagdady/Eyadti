import 'dart:io';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/add_post.dart';
import 'package:departments/screens/doctor/add%20post/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/network/remote/end_point.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitialState());

  static AddPostCubit get(context) => BlocProvider.of(context);

  File? image;

  void changeImage(i) {
    image = i;
    emit(AddPostAddImageState());
  }

  var titleController = TextEditingController();
  var contentController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void> addPost(Map<String, dynamic> data, File? image) async {
    emit(AddPostLoadingState());
    DioHelper dioHelper = DioHelper();
    FormData formData = FormData.fromMap({
      'image': image == null
          ? null
          : await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').last),
      'post_subject': data['post_subject'],
      'body': data['body'],
    });
    dioHelper
        .postData(url: addPostUrl, data: formData, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        emit(AddPostSuccessState());
      } else if (response.statusCode! >= 300 && response.statusCode! < 500) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(AddPostErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
