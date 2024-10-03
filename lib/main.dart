import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartauto/features/auth/login/cubit/auth_cubit.dart';
import 'package:smartauto/features/home/cubit/connect_state.dart';
import 'package:smartauto/features/home/cubit/home_cubit.dart';
import 'package:smartauto/features/home/units/session_listener.dart';

import 'core/bloc_observer.dart';
import 'core/const/themes.dart';
import 'core/const/utils.dart';
import 'core/data/local/cacheHelper.dart';
import 'core/dialoges/toast.dart';
import 'core/keys/keys.dart';
import 'core/router/router.dart';
import 'features/home/cubit/connect_cubit.dart';
import 'features/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  token = CacheHelper.getString(SharedKeys.token);

  runApp(EasyLocalization(
      saveLocale: true,
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      path: 'translations',
      fallbackLocale: const Locale('en', ''),
      startLocale: const Locale('ar', ''),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SessionTimeOutListener(
      duration: const Duration(minutes: 1),
      onTimeOut: () {
        SystemNavigator.pop();
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CheckConnectCubit()..initialConnection()),
          BlocProvider(create: (_) => HomeCubit()),
          BlocProvider(create: (_) => SmartAutoLoginCubit()),
        ],
        child: BlocListener<CheckConnectCubit, CheckConnectionState>(
          listener: (context, state) {
            if (state is DisConnect) {
              showToast(
                  msg: EasyLocalization.of(context)!.currentLocale ==
                          const Locale('ar', '')
                      ? 'الجهاز غير متصل'
                      : 'The device is offline',
                  state: ToastedStates.ERROR);
            } else if (state is Connect) {
              showToast(
                  msg: EasyLocalization.of(context)!.currentLocale ==
                          const Locale('ar', '')
                      ? 'الجهاز  متصل'
                      : 'The device is online.',
                  state: ToastedStates.SUCCESS);
            }
          },
          child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (BuildContext context, Widget? child) {
                return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaler: const TextScaler.linear(1.0)),
                    child: MaterialApp(
                        debugShowCheckedModeBanner: false,
                        localizationsDelegates: context.localizationDelegates,
                        locale: context.locale,
                        supportedLocales: context.supportedLocales,
                        navigatorKey: navigatorKey,
                        theme: lightTheme,
                        darkTheme: darkTheme,
                        themeMode: ThemeMode.light,
                        home: const SplashScreen()));
              }),
        ),
      ),
    );
  }
}
