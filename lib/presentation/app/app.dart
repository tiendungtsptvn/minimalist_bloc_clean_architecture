import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/app/locale/locale_cubit.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/app/theme/theme_cubit.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/main_screen/main_screen.dart';
import 'package:minimalist_bloc_clean_architecture/resource/app_languages.dart';
import 'package:minimalist_bloc_clean_architecture/resource/style/app_themes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AppThemeRegistry.initializeDefaultThemes();
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
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => GetIt.I<ThemeCubit>()),
              BlocProvider(create: (context) => GetIt.I<LocaleCubit>()),
            ],
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) {
                final themeData =
                    AppThemeRegistry.getTheme(themeState.currentTheme);

                return BlocListener<LocaleCubit, LocaleState>(
                  listener: (context, state) {
                    context.setLocale(state.currentLocale);
                  },
                  child: MaterialApp(
                    title: 'Flutter Demo',
                    theme: themeData,
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    home: const MainScreen(),
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
