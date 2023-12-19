
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/app/bloc/app_bloc.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/main_screen/main_screen.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/shared_view/bottom_bar/bloc/bottom_bar_bloc.dart';
import 'package:minimalist_bloc_clean_architecture/resource/app_languages.dart';
import 'package:minimalist_bloc_clean_architecture/resource/style/app_themes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GlobalAppCubit appBloc;

  @override
  void initState() {
    appBloc = GlobalAppCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: AppLanguages.supportedLocales,
      path: AppLanguages.path,
      fallbackLocale: AppLanguages.fallbackLocale,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider.value(
            value: appBloc,
            child: BlocBuilder<GlobalAppCubit, GlobalAppState>(
              bloc: appBloc,
              builder: (context, state) {
                return MaterialApp(
                  title: 'Flutter Demo',
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  debugShowCheckedModeBanner: false,
                  themeMode: state.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  home: MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) => BottomBarCubit()),
                    ],
                    child: const MainScreen(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
