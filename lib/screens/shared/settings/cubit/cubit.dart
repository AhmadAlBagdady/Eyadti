import 'package:bloc/bloc.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/settings/change_language.dart';
import 'package:departments/screens/shared/settings/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitialState());
  static SettingsCubit get(context) => BlocProvider.of(context);

  String? selectedMode;
  String? selectedLanguage;

  List<String> language = ['العربية', 'English'];

  void changeSelectedItem(String type, value) {
    type == 'mode'
        ? selectedMode = value
        : value == 'English'
            ? selectedLanguage = 'en'
            : selectedLanguage = 'ar';
    emit(SettingsChangeSelectedItem());
  }

  void changeLanguage({required String newLanguage}) {
    {
      emit(SettingsChangeLanguageLoadingState());
      DioHelper dioHelper = DioHelper();
      dioHelper
          .postData(
              url: changeLanguageUrl, data: {'lang': newLanguage}, token: token)
          .then((response) {
        if (response.statusCode! < 300) {
          late ChangeLanguage changeLanguage;
          changeLanguage = ChangeLanguage.fromJson(response.data);
          emit(SettingsChangeLanguageSuccessState(changeLanguage));
        } else if (response.statusCode! < 500 && response.statusCode! > 300) {
          late ErrorModel errorModel;
          errorModel = ErrorModel.fromJson(response.data);
          emit(SettingsChangeLanguageErrorState(errorModel));
        } else if (response.statusCode! >= 500) {
          showToast(msg: LocaleKeys.errorServer.tr(), color: red);
        }
      });
    }
  }
}
