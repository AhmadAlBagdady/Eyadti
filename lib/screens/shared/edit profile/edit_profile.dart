import 'dart:async';

import 'package:departments/models/profile/edit_profile.dart';
import 'package:departments/screens/shared/edit%20profile/cubit/cubit.dart';
import 'package:departments/screens/shared/edit%20profile/cubit/state.dart';
import 'package:departments/screens/shared/profile/cubit/cubit.dart';
import 'package:departments/screens/shared/profile/profile.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/widgets/person_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  EditProfileModel? editProfileModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileSuccessState) {
            editProfileModel = state.editProfileModel;
            showToast(msg: state.editProfileModel.message!, color: green);
          } else if (state is EditProfileErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          EditProfileCubit editProfileCubit = EditProfileCubit.get(context);
          ProfileCubit profileCubit = ProfileCubit();

          return Scaffold(
              appBar: AppBar(
                  elevation: 0,
                  leading: Padding(
                    padding: EdgeInsets.only(left: size.width / 14),
                    child: appBarButton(
                        onPressed: () {
                          Profile();
                          Navigator.of(context).pop();
                        },
                        size: size,
                        icon: MyIcons.angle_left),
                  ),
                  title: Text(
                    'Edit profile',
                    style: Fonts.semiBold(
                        size: size.height * 20 / 812, color: white),
                  ),
                  backgroundColor: lightBlue,
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: size.width * 34.34 / 375,
                          left: size.width * 17.13 / 375),
                      child: appBarButton(
                          onPressed: () {
                            editProfileCubit.editProfile(
                              contactNumber: ProfileCubit.contactNumbers,
                              emailAddress: ProfileCubit.emailAddress,
                            );
                          },
                          icon: MyIcons.check__1_,
                          size: size),
                    ),
                  ]),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    PersonInfo(
                        isItEdit: true,
                        first: ProfileCubit.firstName,
                        father: ProfileCubit.fatherName,
                        last: ProfileCubit.lastName,
                        birth: ProfileCubit.birthDate,
                        contactNumbers: ProfileCubit.contactNumbers,
                        email: ProfileCubit.emailAddress,
                        cubit: profileCubit,
                        gender: ProfileCubit.gender)
                  ],
                ),
              ));
        },
      ),
    );
  }
}
