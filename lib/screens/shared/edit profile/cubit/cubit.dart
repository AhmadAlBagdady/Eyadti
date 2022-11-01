import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/profile/edit_profile.dart';
import 'package:departments/screens/shared/edit%20profile/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitialState());

  static EditProfileCubit get(context) => BlocProvider.of(context);

  DateTime? timeDate;

  final formKey = GlobalKey<FormState>();

  List<String> sex = ['male', 'female'];

  void editProfile({
    required List<String> contactNumber,
    required dynamic emailAddress,
  }) {
    emit(EditProfileLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(
            url: editProfileUrl,
            data: {
              'phone_number': contactNumber,
              'email': emailAddress,
            },
            token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late EditProfileModel editProfileModel;
        editProfileModel = EditProfileModel.fromJson(response.data);
        emit(EditProfileSuccessState(editProfileModel));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(EditProfileErrorState(errorModel));
      } else {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
