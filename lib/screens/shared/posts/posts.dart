import 'package:departments/models/news/delete_post.dart';
import 'package:departments/models/news/get_posts_by_id.dart';
import 'package:departments/screens/doctor/add%20post/add_post.dart';
import 'package:departments/screens/shared/posts/cubit/cubit.dart';
import 'package:departments/screens/shared/posts/cubit/state.dart';
import 'package:departments/screens/shared/search/search.dart';
import 'package:departments/screens/shared/single%20post/single_post.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/widgets/custom_post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Posts extends StatelessWidget {
  Posts({Key? key, required this.id,required this.departmentName}) : super(key: key);
  final int id;
  String departmentName;
  GetPostsById? getPostsById;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit()..getPostsById(id),
      child: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {
          if (state is PostsGetPostsSuccessState) {
            getPostsById = state.getPosts;
          } else if (state is PostsGetPostsErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
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
                title:  Text(departmentName),
                backgroundColor: lightBlue,
                actions: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Search(
                                searchType: 'postDepartments',
                                id: id,
                              )));
                    },
                    child: Padding(
                      padding: role == 'Patient'
                          ? EdgeInsets.only(
                              right: size.width * 28 / 375,
                              left: size.width * 15.79 / 375)
                          : EdgeInsets.all(0),
                      child: Icon(
                        MyIcons.search,
                        size: size.height * 16.21 / 812,
                        color: white,
                      ),
                    ),
                  ),
                  role == 'Doctor'
                      ? Padding(
                          padding: EdgeInsets.only(
                              right: size.width * 28 / 375,
                              left: size.width * 15.79 / 375),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddPost()));
                            },
                            child: Icon(
                              Icons.add,
                              size: size.height * 25 / 812,
                            ),
                          ),
                        )
                      : Container()
                ]),
            body: getPostsById == null
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    width: size.width,
                    height: size.height,
                    color: white,
                    child: ListView.separated(
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
                                      departmentName: departmentName,
                                        id: getPostsById!.data![index].id!,
                                        image: getPostsById!.data![index].image,
                                        title: getPostsById!
                                            .data![index].postTitle!,
                                        publisher: getPostsById!
                                            .data![index].publisherName!,
                                        likeNum:
                                            getPostsById!.data![index].likes!,
                                        viewNum:
                                            getPostsById!.data![index].views!,
                                        date: getPostsById!
                                            .data![index].postDate!),
                                  ),
                                );
                              },
                              child: PostCard(
                                  image: getPostsById!.data![index].image,
                                  title: getPostsById!.data![index].postTitle!,
                                  publisher:
                                      getPostsById!.data![index].publisherName!,
                                  likeNum: getPostsById!.data![index].likes!,
                                  viewNum: getPostsById!.data![index].views!,
                                  date: getPostsById!.data![index].postDate!),
                            ),
                        itemCount: getPostsById!.data!.length),
                  ),
          );
        },
      ),
    );
  }
}
