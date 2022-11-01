import 'dart:ui';
import 'package:departments/screens/doctor/add%20post/cubit/cubit.dart';
import 'package:departments/screens/doctor/add%20post/cubit/state.dart';
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

class AddPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: BlocConsumer<AddPostCubit, AddPostState>(
        listener: (context, state) {
          if (state is AddPostSuccessState) {
            showToast(
                    msg: LocaleKeys.postCreatedSuccessfully.tr(), color: green)
                .then((value) {
              Navigator.of(context).pop();
            });
          } else if (state is AddPostErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          AddPostCubit addPostCubit = AddPostCubit.get(context);
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
                LocaleKeys.newPost.tr(),
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
                child: Form(
                  key: addPostCubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addPostCubit.image == null
                          ? Container(
                              height: size.height * 195 / 812,
                              width: size.width * 307 / 375,
                              decoration: BoxDecoration(
                                border: Border.all(color: darkBlue),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) => bottomSheet(
                                        context: context,
                                        image: addPostCubit.image,
                                        change: addPostCubit.changeImage)),
                                  );
                                },
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        size: size.height * 23 / 812,
                                        color: darkBlue,
                                      ),
                                      Text(
                                        LocaleKeys.uploadImage.tr(),
                                        style: Fonts.fRegular(
                                            size: 10, color: darkBlue),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Image.file(addPostCubit.image!),
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
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: LocaleKeys.title.tr().toLowerCase(),
                          validate: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.titleValidate.tr();
                            }
                          },
                          controller: addPostCubit.titleController,
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
                      TextFormField(
                        textInputAction: TextInputAction.newline,
                        controller: addPostCubit.contentController,
                        minLines: 1,
                        maxLines: 20,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.contentValidate.tr();
                          }
                        },
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: LocaleKeys.content.tr().toLowerCase(),
                          contentPadding:
                              EdgeInsets.only(left: size.width * 15 / 375),
                          border: OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(width: 2, color: lightBlue),
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
                          if (addPostCubit.formKey.currentState!.validate()) {
                            addPostCubit.addPost({
                              'post_subject': addPostCubit.titleController.text,
                              'body': addPostCubit.contentController.text,
                            }, addPostCubit.image);
                          }
                        },
                        minWidth: double.infinity,
                        height: size.height * 48 / 812,
                        color: lightBlue,
                        child: state is AddPostLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: white,
                                ),
                              )
                            : Text(
                                LocaleKeys.addPost.tr(),
                                style: Fonts.semiBold(
                                    size: size.height * 20 / 812, color: white),
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
