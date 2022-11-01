import 'dart:io';
import 'dart:ui';
import 'package:departments/models/news/edit_post.dart';
import 'package:departments/models/news/get_single_post.dart';
import 'package:departments/screens/doctor/add%20post/cubit/cubit.dart';
import 'package:departments/screens/doctor/edit%20post/cubit/cubit.dart';
import 'package:departments/screens/doctor/edit%20post/cubit/state.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/components/text.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditMyPost extends StatelessWidget {
  EditMyPost({required this.id, required this.image});

  final int id;
  final String image;
  GetSinglePost? getSinglePost;
  EditPost? editPost;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditMyPostCubit()..getSinglePost(id),
      child: BlocConsumer<EditMyPostCubit, EditMyPostState>(
        listener: (context, state) {
          if (state is EditMyPostSuccessState) {
            editPost = state.editPost;
            showToast(msg: editPost!.message!, color: green).then((value) {
              Navigator.of(context).pop();
            });
          } else if (state is EditMyPostErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
          if (state is EditMyPostGetSinglePostSuccessState) {
            getSinglePost = state.getSinglePost;
          } else if (state is EditMyPostGetSinglePostErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          EditMyPostCubit editPostCubit = EditMyPostCubit.get(context);
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
              backgroundColor: lightBlue,
              titleTextStyle: Fonts.semiBold(size: 20, color: white),
              title: Text(
                LocaleKeys.editPost.tr(),
              ),
              actions: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.width * 20.5 / 375),
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.check)),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 34 / 375,
                    vertical: size.height * 26 / 812),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        editPostCubit.image == null
                            ? Container(
                                width: size.width / 1.22,
                                height: size.height / 4.6,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imageUrl + image),
                                      fit: BoxFit.cover),
                                  border: Border.all(color: darkBlue, width: 2),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              )
                            : Image.file(editPostCubit.image!),
                        InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet(
                                  context: context,
                                  image: editPostCubit.image,
                                  change: editPostCubit.changeImage)),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(14),
                                    topRight: Radius.circular(14)),
                                border: Border.all(color: darkBlue, width: 2),
                                color: white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit,
                                  size: size.height * 23 / 812,
                                  color: darkBlue,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 14 / 812,
                    ),
                    Text(
                      LocaleKeys.title.tr(),
                      style: Fonts.fBold(size: 13),
                    ),
                    SizedBox(
                      height: size.height * 14 / 812,
                    ),
                    textFormField(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.titleValidate.tr();
                          }
                        },
                        controller: editPostCubit.titleController,
                        action: TextInputAction.next),
                    SizedBox(
                      height: size.height * 30 / 812,
                    ),
                    Text(
                      LocaleKeys.content.tr(),
                      style: Fonts.fBold(size: 13),
                    ),
                    SizedBox(
                      height: size.height * 14 / 812,
                    ),
                    getSinglePost == null
                        ? CircularProgressIndicator()
                        : TextFormField(
                            textInputAction: TextInputAction.newline,
                            controller: TextEditingController(
                                text: getSinglePost!.data!.content),
                            minLines: 1,
                            maxLines: 20,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.contentValidate.tr();
                              }
                            },
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: LocaleKeys.content.tr(),
                              contentPadding:
                                  EdgeInsets.only(left: size.width * 15 / 375),
                              border: OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide:
                                    BorderSide(width: 2, color: lightBlue),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: size.height * 30 / 812,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 0,
                      onPressed: () {
                        editPostCubit.editPost({
                          'id': id,
                          'post_subject': editPostCubit.titleController.text,
                          'body': editPostCubit.contentController.text,
                        }, editPostCubit.image);
                      },
                      minWidth: double.infinity,
                      height: size.height * 48 / 812,
                      color: lightBlue,
                      child: state is EditMyPostLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: white,
                              ),
                            )
                          : Text(
                              LocaleKeys.editPost.tr(),
                              style: Fonts.semiBold(
                                  size: size.height * 20 / 812, color: white),
                            ),
                    )
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
