import 'dart:ui';

class AppUtils {
  AppUtils._();

  /// Parse locale from locale name string.
  /// Supports multiple formats: "en_US", "en-US", "en", etc.
  static Locale? getLocaleFromLocaleName(String localeName) {
    if (localeName.isEmpty) return null;

    // Handle format: "en_US" or "en-US"
    final parts = localeName.split(RegExp(r'[_-]'));
    if (parts.length >= 2) {
      return Locale(parts[0], parts[1]);
    } else if (parts.length == 1 && parts[0].isNotEmpty) {
      return Locale(parts[0]);
    }

    return null;
  }
}
