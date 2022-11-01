import 'package:bloc/bloc.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/delete_post.dart';
import 'package:departments/models/news/get_blog_departments.dart';
import 'package:departments/models/news/get_posts_by_id.dart';
import 'package:departments/screens/shared/news/cubit/state.dart';
import 'package:departments/screens/shared/posts/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitialState());

  static PostsCubit get(context) => BlocProvider.of(context);

  void getPostsById(int id) {
    emit(PostsGetPostsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getPostsByIdUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetPostsById getPosts;
        getPosts = GetPostsById.fromJson(response.data);
        emit(PostsGetPostsSuccessState(getPosts));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(PostsGetPostsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
