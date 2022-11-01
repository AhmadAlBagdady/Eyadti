import 'package:departments/models/news/delete_post.dart';
import 'package:departments/models/news/get_single_post.dart';
import 'package:departments/screens/doctor/add%20post/add_post.dart';
import 'package:departments/screens/shared/single%20post/cubit/cubit.dart';
import 'package:departments/screens/shared/single%20post/cubit/state.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/news/put_like.dart';

class SinglePost extends StatelessWidget {
  SinglePost({
    Key? key,
    required this.departmentName,
    required this.title,
    required this.publisher,
    required this.date,
    required this.viewNum,
    required this.likeNum,
    required this.image,
    required this.id,
  }) : super(key: key);
  final String departmentName;
  final int id;
  final String title;
  final String publisher;
  final String date;
  final int viewNum;
  final int likeNum;
  final dynamic image;
  PutLike? putLike;
  GetSinglePost? getSinglePost;
  DeletePost? deletePost;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SinglePostCubit()..getSinglePost(id),
      child: BlocConsumer<SinglePostCubit, SinglePostState>(
        listener: (context, state) {
          if (state is SinglePostPutLikeSuccessState) {
            putLike = state.putLike;
          } else if (state is SinglePostPutLikeErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }

          if (state is SinglePostGetSinglePostSuccessState) {
            getSinglePost = state.getSinglePost;
          } else if (state is SinglePostGetSinglePostErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          SinglePostCubit singlePostCubit = SinglePostCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: EdgeInsets.only(left: size.width / 14),
                child: appBarButton(
                    onPressed: () {
                      Navigator.of(context).pop(context);
                    },
                    size: size,
                    icon: MyIcons.angle_left),
              ),
              elevation: 0,
              toolbarHeight: size.height * 54 / 812,
              backgroundColor: lightBlue,
              title: Text(
                'Teeth',
                style:
                    Fonts.semiBold(size: size.height * 20 / 812, color: white),
              ),
              actions: [
                Padding(
                  padding: role == 'Patient'
                      ? EdgeInsets.only(
                          right: size.width * 28 / 375,
                          left: size.width * 15.79 / 375)
                      : EdgeInsets.zero,
                  child: appBarButton(
                      onPressed: () {
                        singlePostCubit.putLike(id);
                      },
                      size: size,
                      icon: putLike != null && putLike!.data!.likes == 1
                          ? Icons.favorite
                          : Icons.favorite_border),
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
                    : Container(),
              ],
            ),
            body: Container(
              padding: EdgeInsets.only(
                  left: size.width / 11,
                  right: size.width / 11,
                  top: size.width / 11),
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    image == null
                        ? Container()
                        : Container(
                            width: size.width / 1.22,
                            height: size.height / 4.6,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(imageUrl + image!),
                                  fit: BoxFit.cover),
                              border: Border.all(color: darkBlue, width: 2),
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                    SizedBox(height: size.height / 116),
                    Text(
                      title,
                      style: Fonts.semiBold(
                          size: size.width / 13.4, color: darkBlue),
                    ),
                    SizedBox(height: size.height / 116),
                    Text(
                      publisher,
                      style: Fonts.semiBold(
                          size: size.width / 31.25, color: lightBlue),
                    ),
                    SizedBox(height: size.height / 116),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          date,
                          style: Fonts.semiBold(
                              size: size.width / 31.25, color: grey),
                        ),
                        Spacer(),
                        CircleAvatar(
                            radius: size.width / 27,
                            backgroundColor: lightBlue,
                            child: CircleAvatar(
                              radius: size.width / 30,
                              backgroundColor: veryLight,
                              child: Icon(
                                MyIcons.eye,
                                size: size.width / 20,
                                color: lightBlue,
                              ),
                            )),
                        SizedBox(
                          width: size.width / 62.5,
                        ),
                        Text(
                          viewNum <= 1000
                              ? '$viewNum'
                              : '${(viewNum / 1000).floor()} K',
                          style: Fonts.fBold(
                              size: size.width / 31.25, color: grey),
                        ),
                        SizedBox(
                          width: size.width / 35,
                        ),
                        CircleAvatar(
                          radius: size.width / 27,
                          backgroundColor: red,
                          child: CircleAvatar(
                            radius: size.width / 30,
                            backgroundColor: lightRed,
                            child: Icon(
                              Icons.favorite,
                              size: size.width / 20,
                              color: red,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width / 62.5,
                        ),
                        Text(
                          likeNum <= 1000
                              ? '$likeNum'
                              : '${(likeNum / 1000).floor()} K',
                          style: Fonts.fBold(
                              size: size.width / 31.25, color: grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 37,
                    ),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: lightBlue,
                    ),
                    SizedBox(
                      height: size.height / 37,
                    ),
                    getSinglePost == null
                        ? Center(child: CircularProgressIndicator())
                        : Wrap(
                            children: [
                              Text(
                                getSinglePost!.data!.content!,
                                style: Fonts.fRegular(
                                    size: size.width / 27, color: grey),
                              )
                            ],
                          ),
                    SizedBox(
                      height: size.height / 37,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
