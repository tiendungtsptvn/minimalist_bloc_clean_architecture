import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:minimalist_bloc_clean_architecture/l10n/generated/l10n.dart';
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
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => GetIt.I<ThemeCubit>()),
            BlocProvider(create: (context) => GetIt.I<LocaleCubit>()),
          ],
          child: BlocBuilder<LocaleCubit, LocaleState>(
            buildWhen: (previous, current) =>
                previous.currentLocale != current.currentLocale,
            builder: (context, localeState) {
              return BlocBuilder<ThemeCubit, ThemeState>(
                buildWhen: (previous, current) =>
                    previous.currentTheme != current.currentTheme,
                builder: (context, themeState) {
                  final themeData =
                      AppThemeRegistry.getTheme(themeState.currentTheme);

                  return MaterialApp(
                    title: 'Flutter Demo',
                    theme: themeData,
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: const [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      AppLocale.delegate,
                    ],
                    supportedLocales: AppLanguages.supportedLocales,
                    locale: localeState.currentLocale,
                    home: const MainScreen(),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
