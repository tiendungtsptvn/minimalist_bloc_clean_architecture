import 'dart:ui';

import 'package:minimalist_bloc_clean_architecture/constant/string.dart';
import 'package:minimalist_bloc_clean_architecture/resource/app_languages.dart';
import 'package:minimalist_bloc_clean_architecture/resource/style/app_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Repository for managing app preferences using SharedPreferences.
class PreferencesRepository {
  final SharedPreferences _prefs;

  PreferencesRepository(this._prefs);

  /// Get saved locale from SharedPreferences.
  /// Returns null if no locale is saved or locale is invalid/not supported.
  Locale? getLocale() {
    try {
      final localeString = _prefs.getString(AppStrings.localeKey);
      if (localeString == null) return null;

      // Format: "en_US" or "vi_VN"
      final parts = localeString.split('_');
      if (parts.length == 2) {
        final locale = Locale(parts[0], parts[1]);
        // Validate locale is supported
        if (AppLanguages.isSupported(locale)) {
          return locale;
        }
      } else if (parts.length == 1) {
        // Only language code
        final locale = Locale(parts[0]);
        if (AppLanguages.isSupported(locale)) {
          return locale;
        }
      }
    } catch (_) {
      // Return null on error
    }
    return null;
  }

  /// Save locale to SharedPreferences.
  /// Format: "en_US" or "vi_VN"
  /// Validates locale before saving.
  Future<void> saveLocale(Locale locale) async {
    try {
      // Validate locale before saving
      if (!AppLanguages.isSupported(locale)) {
        throw ArgumentError(
          'Locale ${locale.toString()} is not supported. '
          'Supported locales: ${AppLanguages.supportedLocales}',
        );
      }

      final localeString = locale.countryCode != null
          ? '${locale.languageCode}_${locale.countryCode}'
          : locale.languageCode;
      await _prefs.setString(AppStrings.localeKey, localeString);
    } catch (e) {
      // Re-throw ArgumentError so caller knows
      if (e is ArgumentError) rethrow;
      // Ignore other errors
    }
  }

  /// Get saved theme from SharedPreferences.
  /// Returns null if no theme is saved or theme is invalid.
  AppTheme? getTheme() {
    try {
      final themeString = _prefs.getString(AppStrings.themeKey);
      if (themeString == null) return null;

      return AppTheme.values.firstWhere(
        (type) => type.name == themeString,
        orElse: () => AppTheme.light,
      );
    } catch (_) {
      return null;
    }
  }

  /// Save theme to SharedPreferences.
  Future<void> saveTheme(AppTheme themeType) async {
    try {
      await _prefs.setString(AppStrings.themeKey, themeType.name);
    } catch (_) {
      // Ignore errors
    }
  }
}
