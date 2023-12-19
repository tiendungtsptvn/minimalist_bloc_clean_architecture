import 'dart:ui';

class AppLanguages {
  const AppLanguages._();

  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];

  /// Change the path of the translation files
  static const path =  'assets/languages';
  /// Default locale.
  static const fallbackLocale = Locale('en', 'US');

}
