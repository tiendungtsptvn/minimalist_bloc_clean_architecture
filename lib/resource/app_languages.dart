import 'dart:ui';

class AppLanguages {
  const AppLanguages._();

  /// List of supported locales.
  /// To add a new language: add Locale here and create corresponding .arb file in lib/l10n/.
  static const supportedLocales = [
    Locale('en', ''),
    Locale('vi', ''),
    // Add new language here
  ];

  /// Default locale when no matching locale is found.
  static const fallbackLocale = Locale('en', '');


  /// Check if locale is supported.
  static bool isSupported(Locale locale) {
    return supportedLocales.any(
      (supported) =>
          supported.languageCode == locale.languageCode &&
          (supported.countryCode == null ||
              supported.countryCode == locale.countryCode),
    );
  }

  /// Find the closest supported locale from device locale.
  /// Tries exact match first, then matches by language code.
  static Locale? findSupportedLocale(Locale deviceLocale) {
    // Find exact match
    try {
      final exactMatch = supportedLocales.firstWhere(
        (locale) =>
            locale.languageCode == deviceLocale.languageCode &&
            locale.countryCode == deviceLocale.countryCode,
      );
      return exactMatch;
    } catch (_) {
      // No exact match, try language code only
    }

    // Find match by language code
    try {
      final languageMatch = supportedLocales.firstWhere(
        (locale) => locale.languageCode == deviceLocale.languageCode,
      );
      return languageMatch;
    } catch (_) {
      // No match found
    }

    return null;
  }
}
