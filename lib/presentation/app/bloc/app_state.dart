import 'dart:ui';

import 'package:minimalist_bloc_clean_architecture/base/bloc/bloc.dart';
import 'package:minimalist_bloc_clean_architecture/resource/app_languages.dart';

class GlobalAppState extends BaseStateApp {
  final bool isDarkTheme;
  final Locale currentLocale;
  const GlobalAppState({
    this.isDarkTheme = false,
    this.currentLocale = AppLanguages.fallbackLocale,
  });

  copyWith({bool? isDarkTheme, Locale? currentLocale}) {
    return GlobalAppState(
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      currentLocale: currentLocale ?? this.currentLocale,
    );
  }

  @override
  List<Object?> get props => [isDarkTheme, currentLocale];
}
