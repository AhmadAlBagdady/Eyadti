import 'package:departments/screens/doctor/my%20posts/cubit/cubit.dart';
import 'package:departments/shared/components/simple_info.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/widgets/post_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyPostCard extends StatelessWidget {
  const MyPostCard(
      {Key? key,
      required this.title,
      required this.publisher,
      required this.date,
      required this.viewNum,
      required this.likeNum,
      required this.image,
      required this.cubit,
      required this.deletePost,
      required this.editPost})
      : super(key: key);
  final MyPostsCubit cubit;
  final String title;
  final String publisher;
  final String date;
  final int viewNum;
  final int likeNum;
  final dynamic image;
  final Function() deletePost;
  final Function() editPost;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width / 20,
          vertical: size.width / 19.7,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 2,
                      child: Wrap(
                        children: [
                          Text(
                            title,
                            maxLines: 2,
                            style: Fonts.semiBold(
                                size: size.width / 26.7, color: darkBlue),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height / 203),
                    Text(publisher,
                        style: Fonts.semiBold(
                            size: size.width / 31.25, color: lightBlue)),
                    SizedBox(
                      height: size.height / 101.5,
                    ),
                    Text(
                      date,
                      style:
                          Fonts.semiBold(size: size.width / 31.25, color: grey),
                    ),
                    SizedBox(
                      height: size.height / 80.5,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PostOptions(deleteFunc: deletePost, editFunc: editPost),
                    image == null
                        ? Container()
                        : Container(
                            width: size.width / 4.3,
                            height: size.width / 4.3,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(imageUrl + image!),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                  color: darkBlue,
                                  width: size.height * 3 / 812),
                            ),
                          ),
                    // SizedBox(height: size.height * 10 / 812,),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  MyIcons.eye,
                  color: lightBlue,
                  size: size.height * 15 / 812,
                ),
                SizedBox(
                  width: size.height * 5 / 812,
                ),
                Text(
                  viewNum <= 1000
                      ? '$viewNum'
                      : '${(viewNum / 1000).floor()} K',
                  style: Fonts.semiBold(
                      size: size.height * 15 / 812, color: lightBlue),
                ),
                SizedBox(
                  width: size.width * 10 / 375,
                ),
                Icon(
                  Icons.favorite,
                  color: red,
                  size: size.height * 15 / 812,
                ),
                SizedBox(
                  width: size.height * 5 / 812,
                ),
                Text(
                  likeNum <= 1000
                      ? '$likeNum'
                      : '${(likeNum / 1000).floor()} K',
                  style:
                      Fonts.semiBold(size: size.height * 15 / 812, color: red),
                ),
              ],
            )
          ],
        ));
  }
}
