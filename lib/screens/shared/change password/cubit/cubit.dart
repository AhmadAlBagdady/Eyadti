import 'package:departments/screens/shared/change%20password/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitialState());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  bool isCurrentPasswordSecure = true;
  bool isNewPasswordSecure = true;
  bool isConfirmPasswordSecure = true;

  void changeSecure(String isSecure) {
    if (isSecure == 'isCurrentPasswordSecure')
      this.isCurrentPasswordSecure = !this.isCurrentPasswordSecure;
    if (isSecure == 'isNewPasswordSecure')
      this.isNewPasswordSecure = !this.isNewPasswordSecure;
    if (isSecure == 'isConfirmPasswordSecure')
      this.isConfirmPasswordSecure = !this.isConfirmPasswordSecure;
    emit(ChangePasswordInitialState());
  }
}
