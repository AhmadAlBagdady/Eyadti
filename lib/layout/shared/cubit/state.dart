import 'package:departments/models/auth/logout_model.dart';
import 'package:departments/models/error%20model/error_model.dart';

abstract class MainState {}

class InitialMainState extends MainState {}

class ChangeBottomNavBar extends MainState {}

class HomeLogoutSuccessState extends MainState{
  final LogoutModel logoutModel;
  HomeLogoutSuccessState(this.logoutModel);
}
class HomeLogoutErrorState extends MainState{
  final ErrorModel errorModel;
  HomeLogoutErrorState(this.errorModel);}

