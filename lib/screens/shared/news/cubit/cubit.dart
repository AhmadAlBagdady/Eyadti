import 'package:bloc/bloc.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/get_blog_departments.dart';
import 'package:departments/models/news/get_posts_by_id.dart';
import 'package:departments/screens/shared/news/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  void getBlogDepartments() {
    emit(NewsGetBlogDepartmentsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .getData(url: getBlogDepartmentsUrl, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetBlogDepartments getBlogDepartments;
        getBlogDepartments = GetBlogDepartments.fromJson(response.data);
        emit(NewsGetBlogDepartmentsSuccessState(getBlogDepartments));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(NewsGetBlogDepartmentsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }

  void getPostById(int id) {
    emit(NewsGetPostsByIdLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(url: getSinglePostUrl, data: {'id': id}, token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetPostsById getPostsById;
        getPostsById = GetPostsById.fromJson(response.data);
        emit(NewsGetPostsByIdSuccessState(getPostsById));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(NewsGetPostsByIdErrorState(errorModel));
      } else {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
