import 'dart:io';
import 'dart:ui';

import 'package:minimalist_bloc_clean_architecture/base/bloc/bloc.dart';
import 'package:minimalist_bloc_clean_architecture/constant/string.dart';
import 'package:minimalist_bloc_clean_architecture/resource/style/app_themes.dart';
import 'package:minimalist_bloc_clean_architecture/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_state.dart';

export 'app_state.dart';

/// Bloc for manage state of global app.
///
/// Use for: theme, language, ...
class GlobalAppCubit extends BaseCubitApp<GlobalAppState> {
  GlobalAppCubit() : super(const GlobalAppState());

  late SharedPreferences _prefs;
  late Future<void> Function(Locale locale) _contextSetLocale;

  void init() {}

  /// Change app theme.
  void changeTheme() {
    _updateThemeSetting(!state.isDarkTheme);
    emit(state.copyWith(isDarkTheme: !state.isDarkTheme));
  }

  /// Update theme setting.
  void _updateThemeSetting(bool isDarkTheme) {
    AppThemeSetting.currentAppThemeType = isDarkTheme ? AppThemeType.dark : AppThemeType.light;
  }

  /// Init locale.
  /// Get locale from shared preferences ìf exist else get device locale.
  /// Note: you just can call it after Localization initialized.
  Future<void> initLocale({
    required Future<void> Function(Locale locale) contextSetLocale,
  }) async {
    _contextSetLocale = contextSetLocale;
    // Get locale from shared preferences.
    _prefs = await SharedPreferences.getInstance();
    final Locale? locale = await _getLocaleFromSharedPreferences(_prefs);
    // If saved locale not null set it as current locale.
    if (locale != null) {
      emit(state.copyWith(currentLocale: locale));
      _contextSetLocale(locale);
      return;
    }
    // If saved locale null set device locale as current locale.
    final deviceLocale = AppUtils.getLocaleFromLocaleName(Platform.localeName);
    if (deviceLocale != null) {
      emit(state.copyWith(currentLocale: deviceLocale));
      _contextSetLocale(deviceLocale);
    }
  }

  void changeAppLocale(Locale locale) {
    if (locale.languageCode != state.currentLocale.languageCode ||
        locale.countryCode != state.currentLocale.countryCode) {
      _saveLocaleToSharedPreferences(_prefs, locale.languageCode, locale.countryCode);
      _contextSetLocale(locale);
      emit(state.copyWith(currentLocale: locale));
    }
  }

  /// Get language code from shared preferences.
  Future<Locale?> _getLocaleFromSharedPreferences(SharedPreferences prefs) async {
    String? languageCode;
    String? countryCode;
    try {
      languageCode = prefs.getString(AppStrings.currentLanguageCodeApp);
      countryCode = prefs.getString(AppStrings.currentCountryCodeApp);
    } catch (_) {}
    if (languageCode != null) {
      return Locale(languageCode, countryCode);
    }
    return null;
  }

  /// Save language code to shared preferences.
  /// Include: save language code and country code.
  void _saveLocaleToSharedPreferences(
    SharedPreferences prefs,
    String languageCode,
    String? countryCode,
  ) async {
    try {
      prefs.setString(AppStrings.currentLanguageCodeApp, languageCode);
      if (countryCode != null) {
        prefs.setString(AppStrings.currentCountryCodeApp, countryCode);
      }
    } catch (_) {}
  }
}
