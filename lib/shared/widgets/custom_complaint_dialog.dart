import 'package:departments/models/settings/send_report.dart';
import 'package:departments/screens/shared/drawer/cubit/cubit.dart';
import 'package:departments/screens/shared/drawer/cubit/state.dart';
import 'package:departments/screens/shared/home/homeCubit/cubit.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/text.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddComplaintDialog extends StatelessWidget {
  final DrawerCubit drawerCubit;
  Widget? materialButtonChild;
  Function()? onPressed;

  AddComplaintDialog(
      {Key? key,
      required this.drawerCubit,
      required this.materialButtonChild,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      titlePadding: EdgeInsets.all(0),
      title: AppBar(
        backgroundColor: lightBlue,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              MyIcons.angle_left,
              size: size.height * 18.2 / 812,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text(LocaleKeys.complaints.tr(),
            style: Fonts.semiBold(size: 20, color: white)),
        titleSpacing: size.width * 21.43 / 375,
      ),
      content: SizedBox(
        height: size.height * 260 / 812,
        width: size.width * 287 / 375,
        child: SingleChildScrollView(
            child: Form(
          key: drawerCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.title.tr(),
                style: Fonts.semiBold(
                    size: size.width * 14 / 375, color: darkBlue),
              ),
              SizedBox(
                height: size.height * 10 / 812,
              ),
              textFormField(
                  controller: drawerCubit.titleController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return LocaleKeys.titleValidate.tr();
                    }
                  },
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: LocaleKeys.complaints.tr().toLowerCase()),
              SizedBox(
                height: size.height * 20 / 812,
              ),
              Text(
                LocaleKeys.content.tr(),
                style: Fonts.semiBold(
                    size: size.width * 14 / 375, color: darkBlue),
              ),
              SizedBox(
                height: size.height * 10 / 812,
              ),
              TextFormField(
                controller: drawerCubit.contentController,
                minLines: 1,
                maxLines: 20,
                validator: (value) {
                  if (value!.isEmpty) {
                    return LocaleKeys.contentValidate.tr();
                  }
                },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: LocaleKeys.content.tr(),
                  contentPadding: EdgeInsets.only(left: size.width * 15 / 375),
                  border: OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(width: 2, color: lightBlue),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
      actions: [
        MaterialButton(
          onPressed: onPressed,
          color: lightBlue,
          elevation: 0,
          child: materialButtonChild,
        )
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
