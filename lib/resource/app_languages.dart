import 'dart:ui';

class AppLanguages {
  const AppLanguages._();

  /// List of supported locales.
  /// To add a new language: add Locale here and create corresponding JSON file.
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
    // Add new language here
  ];

  /// Path to translation files directory.
  static const path = 'assets/languages';

  /// Default locale when no matching locale is found.
  static const fallbackLocale = Locale('en', 'US');

  /// Get JSON file name from Locale.
  /// Format: "en-US.json" or "vi-VN.json"
  static String getFileName(Locale locale) {
    final countryCode = locale.countryCode ?? '';
    return countryCode.isEmpty
        ? '${locale.languageCode}.json'
        : '${locale.languageCode}-$countryCode.json';
  }

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
