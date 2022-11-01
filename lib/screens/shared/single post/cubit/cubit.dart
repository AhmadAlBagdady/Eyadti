import 'package:bloc/bloc.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/delete_post.dart';
import 'package:departments/models/news/get_blog_departments.dart';
import 'package:departments/models/news/get_posts_by_id.dart';
import 'package:departments/models/news/get_single_post.dart';
import 'package:departments/models/news/put_like.dart';
import 'package:departments/screens/shared/news/cubit/state.dart';
import 'package:departments/screens/shared/single%20post/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SinglePostCubit extends Cubit<SinglePostState> {
  SinglePostCubit() : super(SinglePostInitialState());

  static SinglePostCubit get(context) => BlocProvider.of(context);

  void putLike(int id) {
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: putLikeUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late PutLike putLike;
        putLike = PutLike.fromJson(response.data);
        emit(SinglePostPutLikeSuccessState(putLike));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SinglePostPutLikeErrorState(errorModel));
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
        emit(SinglePostGetSinglePostSuccessState(getSinglePost));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(SinglePostPutLikeErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
