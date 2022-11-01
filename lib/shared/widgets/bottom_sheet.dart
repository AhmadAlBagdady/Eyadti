import 'dart:io';

import 'package:departments/screens/doctor/add%20post/cubit/cubit.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/color.dart';

Widget bottomSheet({required File? image,required void change(dynamic) ,required BuildContext context}) {
  return Container(
    width: size.width,
    color: lightBlue,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            height: size.height * 100 / 812,
            minWidth: size.width/2.5,
            onPressed: () {
              pickImage(ImageSource.gallery, image).then((value) {
                Navigator.of(context).pop();
                change(value);
              });
            },
            child: Row(
              children: [
                const Icon(
                  Icons.image,
                  color: white,
                ),
                const SizedBox(width: 15,),
                Text(
                  LocaleKeys.gallery.tr(),
                  style:
                      Fonts.fBold(size: size.height * 18 / 812, color: white),
                ),
              ],
            ),
          ),
          Spacer(),
          MaterialButton(
            minWidth: size.width/2.5,
            height: size.height * 100 /812,
            onPressed: () {
              pickImage(ImageSource.camera, image).then((value) {
                Navigator.of(context).pop();
                change(value);
              });
            },
            child: Row(
              children: [
                const Icon(
                  Icons.camera_enhance,
                  color: white,
                ),
                const SizedBox(width: 15,),
                Text(
                  LocaleKeys.camera.tr(),
                  style:
                      Fonts.fBold(size: size.height * 18 / 812, color: white),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
