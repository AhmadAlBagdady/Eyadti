import 'package:departments/layout/shared/cubit/cubit.dart';
import 'package:departments/layout/shared/cubit/state.dart';
import 'package:departments/screens/shared/splash/splash_screen.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/bloc_observer.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/translations/codegen_loader.dart';
import 'package:departments/shared/network/local/cach_helper.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();
      await CacheHelper.init();
      await getAppInfo();
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            systemNavigationBarColor: lightBlue,
            systemNavigationBarDividerColor: lightBlue),
      );
      await EasyLocalization.ensureInitialized();
      runApp(EasyLocalization(
          path: 'assets/translations/',
          supportedLocales: const [Locale('en'), Locale('ar')],
          fallbackLocale: const Locale('en'),
          assetLoader: const CodegenLoader(),
          child: const MyApp()));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'Eyadty',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
