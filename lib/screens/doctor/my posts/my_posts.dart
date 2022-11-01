import 'package:departments/models/news/delete_post.dart';
import 'package:departments/models/news/edit_post.dart';
import 'package:departments/models/news/get_my_posts.dart';
import 'package:departments/screens/doctor/add%20post/add_post.dart';
import 'package:departments/screens/doctor/edit%20post/cubit/cubit.dart';
import 'package:departments/screens/doctor/edit%20post/edit_my_post.dart';
import 'package:departments/screens/doctor/my%20posts/cubit/cubit.dart';
import 'package:departments/screens/doctor/my%20posts/cubit/state.dart';
import 'package:departments/screens/shared/single%20post/single_post.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/my_post_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPosts extends StatelessWidget {
  MyPosts({
    Key? key,
  }) : super(key: key);
  GetMyPosts? getMyPosts;
  DeletePost? deletePost;
  EditPost? editPost;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyPostsCubit()..getMyPosts(),
      child: BlocConsumer<MyPostsCubit, MyPostsState>(
        listener: (context, state) {
          if (state is MyPostsGetMyPostsSuccessState) {
            getMyPosts = state.getMyPosts;
          } else if (state is MyPostsGetMyPostsErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
          if (state is MyPostsDeletePostSuccessState) {
            showToast(msg: state.deletePost.message!, color: green);
            deletePost = state.deletePost;
          } else if (state is MyPostsDeletePostErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
          if (state is MyPostsEditPostSuccessState) {
            showToast(msg: state.editPost.message!, color: green);
            editPost = state.editPost;
          } else if (state is MyPostsEditPostErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          MyPostsCubit myPostsCubit = MyPostsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
                elevation: 0,
                leading: Padding(
                  padding: EdgeInsets.only(left: size.width / 14),
                  child: appBarButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      size: size,
                      icon: MyIcons.angle_left),
                ),
                title: Text(
                  LocaleKeys.myPosts.tr(),
                  style: Fonts.semiBold(
                      size: size.height * 20 / 812, color: Colors.white),
                ),
                backgroundColor: lightBlue,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: size.width * 28 / 375,
                        left: size.width * 15.79 / 375),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => AddPost()));
                      },
                      child: Icon(
                        Icons.add,
                        size: size.height * 25 / 812,
                      ),
                    ),
                  )
                ]),
            body: state is MyPostsGetMyPostsLoadingState
                ? const Center(child: CircularProgressIndicator())
                : getMyPosts!.data == null
                    ? Center(
                        child: Text(getMyPosts!.message!),
                      )
                    : Container(
                        width: size.width,
                        height: size.height,
                        color: white,
                        child: ListView.separated(
                            key: myPostsCubit.listKey,
                            padding: EdgeInsets.only(bottom: size.height / 10),
                            separatorBuilder: (context, index) => Container(
                                  color: veryLightBlue.withOpacity(0.2),
                                  height: size.height / 81.2,
                                ),
                            itemBuilder: (context, index) => MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SinglePost(
                                        departmentName: '',
                                          id: getMyPosts!.data![index].id!,
                                          image:
                                              getMyPosts!.data![index].image!,
                                          title: getMyPosts!
                                              .data![index].postTitle!,
                                          publisher: getMyPosts!
                                              .data![index].publisherName!,
                                          likeNum:
                                              getMyPosts!.data![index].likes!,
                                          viewNum:
                                              getMyPosts!.data![index].views!,
                                          date: getMyPosts!
                                              .data![index].postDate!),
                                    ),
                                  );
                                },
                                child: MyPostCard(
                                    deletePost: () {
                                      state is MyPostsDeletePostLoadingState
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : myPostsCubit.deletePost(
                                              id: getMyPosts!.data![index].id!);
                                      Navigator.pop(context);
                                      myPostsCubit.getMyPosts();
                                    },
                                    editPost: () {
                                      EditMyPostCubit.title =
                                          getMyPosts!.data![index].postTitle!;
                                      Navigator.pop(context);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => EditMyPost(
                                                  image: getMyPosts!
                                                      .data![index].image!,
                                                  id: getMyPosts!
                                                      .data![index].id!)));
                                    },
                                    cubit: MyPostsCubit.get(context),
                                    image: getMyPosts!.data![index].image,
                                    title: getMyPosts!.data![index].postTitle!,
                                    publisher:
                                        getMyPosts!.data![index].publisherName!,
                                    likeNum: getMyPosts!.data![index].likes!,
                                    viewNum: getMyPosts!.data![index].views!,
                                    date: getMyPosts!.data![index].postDate!)),
                            itemCount: getMyPosts!.data!.length),
                      ),
          );
        },
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<EditPost?>('editPost', editPost));
  }
}
