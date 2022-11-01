import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/settings/change_language.dart';

abstract class SettingsState {}

class SettingsInitialState extends SettingsState {}

class SettingsChangeSelectedItem extends SettingsState {}

class SettingsChangeLanguageSuccessState extends SettingsState {
  final ChangeLanguage changeLanguage;
  SettingsChangeLanguageSuccessState(this.changeLanguage);
}

class SettingsChangeLanguageErrorState extends SettingsState {
  final ErrorModel errorModel;
  SettingsChangeLanguageErrorState(this.errorModel);
}

class SettingsChangeLanguageLoadingState extends SettingsState {}
