import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import '../../../data/repositories/repositories.dart';
import '../../../resource/app_languages.dart';
import '../../../resource/style/app_themes.dart';
import '../../../utils/app_utils.dart';
import '../base/bloc/base_cubit_app.dart';
import 'app_state.dart';

export 'app_state.dart';

/// Cubit for managing global app state (locale and theme).
class GlobalAppCubit extends BaseCubitApp<GlobalAppState> {
  final PreferencesRepository _prefsRepo;
  bool _isInitialized = false;

  GlobalAppCubit(this._prefsRepo)
      : super(
          const GlobalAppState(
            currentLocale: AppLanguages.fallbackLocale,
            currentTheme: AppTheme.light,
          ),
        );

  /// Initialize app settings (locale and theme) from SharedPreferences or defaults.
  Future<void> init() async {
    if (_isInitialized) return;
    _isInitialized = true;

    await Future.wait([
      _initLocale(),
      _initTheme(),
    ]);
  }

  /// Initialize locale from SharedPreferences or device locale.
  Future<void> _initLocale() async {
    final savedLocale = _prefsRepo.getLocale();
    Locale selectedLocale = savedLocale != null && AppLanguages.isSupported(savedLocale)
        ? savedLocale
        : _getDeviceLocale() ?? AppLanguages.fallbackLocale;

    if (savedLocale == null) {
      await _prefsRepo.saveLocale(selectedLocale);
    }

    log('Locale initial: ${selectedLocale.languageCode}');
    _emitLocale(selectedLocale);
  }

  /// Initialize theme from SharedPreferences or default.
  Future<void> _initTheme() async {
    final savedTheme = _prefsRepo.getTheme();
    final theme = savedTheme ?? AppTheme.light;

    if (savedTheme == null) {
      await _prefsRepo.saveTheme(theme);
    }

    _emitTheme(theme);
  }

  /// Get device locale if supported.
  Locale? _getDeviceLocale() {
    final deviceLocale = AppUtils.getLocaleFromLocaleName(Platform.localeName);
    return deviceLocale != null
        ? AppLanguages.findSupportedLocale(deviceLocale)
        : null;
  }

  /// Change app locale.
  void changeLocale(Locale locale) {
    if (!AppLanguages.isSupported(locale)) {
      throw ArgumentError(
        'Locale $locale is not supported. '
        'Supported locales: ${AppLanguages.supportedLocales}',
      );
    }

    if (_isLocaleChanged(locale)) {
      log('Change locale to ${locale.languageCode}');
      _prefsRepo.saveLocale(locale);
      _emitLocale(locale);
    }
  }

  /// Switch between supported languages.
  void switchLanguage() {
    final currentIndex = AppLanguages.supportedLocales
        .indexWhere((l) => l.languageCode == state.currentLocale.languageCode);
    final nextIndex = (currentIndex + 1) % AppLanguages.supportedLocales.length;
    changeLocale(AppLanguages.supportedLocales[nextIndex]);
  }

  /// Change theme to specific type.
  void setTheme(AppTheme themeType) {
    if (state.currentTheme != themeType) {
      _prefsRepo.saveTheme(themeType);
      _emitTheme(themeType);
    }
  }

  /// Toggle between light and dark (backward compatibility).
  void changeTheme() {
    final newTheme = state.currentTheme == AppTheme.light
        ? AppTheme.dark
        : AppTheme.light;
    setTheme(newTheme);
  }

  /// Get next theme in cycle.
  void cycleTheme() {
    final availableThemes = AppThemeRegistry.getAvailableThemes();
    if (availableThemes.isEmpty) return;

    final currentIndex = availableThemes.indexOf(state.currentTheme);
    final nextIndex = (currentIndex + 1) % availableThemes.length;
    setTheme(availableThemes[nextIndex]);
  }

  /// Emit locale change.
  void _emitLocale(Locale locale) {
    emit(state.copyWith(currentLocale: locale));
  }

  /// Emit theme change.
  void _emitTheme(AppTheme themeType) {
    AppThemeSetting.currentAppThemeType = themeType;
    emit(state.copyWith(currentTheme: themeType));
  }

  /// Check if locale has changed.
  bool _isLocaleChanged(Locale locale) {
    return locale.languageCode != state.currentLocale.languageCode ||
        locale.countryCode != state.currentLocale.countryCode;
  }
}
