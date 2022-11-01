import 'package:departments/models/auth/login_model.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/screens/shared/login/loginCubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/network/remote/end_point.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void loginUser({
    required String emailController,
    required String passwordController,
  }) {
    emit(LoginLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.postData(url: loginUrl, data: {
      'username': emailController,
      'password': passwordController
    }).then((response) {
      if (response.statusCode! < 300) {
        late LoginModel loginModel;
        loginModel = LoginModel.fromJson(response.data);
        emit(LoginSuccessState(loginModel));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(LoginErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: LocaleKeys.errorServer.tr(), color: red);
      }
    });
  }

  bool isPasswordSecure = true;

  void changeSecure() {
    isPasswordSecure = !isPasswordSecure;
    emit(LoginInitialState());
  }
}
