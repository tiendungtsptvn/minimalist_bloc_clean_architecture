import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:minimalist_bloc_clean_architecture/data/repositories/repositories.dart';
import 'package:minimalist_bloc_clean_architecture/resource/app_languages.dart';
import 'package:minimalist_bloc_clean_architecture/utils/app_utils.dart';
import '../base/bloc/base_cubit_app.dart';
import 'locale_state.dart';

export 'locale_state.dart';

/// Cubit for managing app locale/language state.
class LocaleCubit extends BaseCubitApp<LocaleState> {
  final PreferencesRepository _prefsRepo;
  bool _isInitialized = false;

  LocaleCubit(this._prefsRepo)
      : super(const LocaleState(currentLocale: AppLanguages.fallbackLocale));

  /// Initialize locale from SharedPreferences or device locale.
  Future<void> initLocale() async {
    if (_isInitialized) return;
    _isInitialized = true;

    Locale selectedLocale = AppLanguages.fallbackLocale;

    final savedLocale = _prefsRepo.getLocale();
    if (savedLocale != null && AppLanguages.isSupported(savedLocale)) {
      selectedLocale = savedLocale;
    } else {
      final deviceLocale =
          AppUtils.getLocaleFromLocaleName(Platform.localeName);
      if (deviceLocale != null) {
        final supportedLocale = AppLanguages.findSupportedLocale(deviceLocale);
        if (supportedLocale != null) {
          selectedLocale = supportedLocale;
        }
      }

      await _prefsRepo.saveLocale(selectedLocale);
    }
    log('Locale initial: ${selectedLocale.languageCode}');
    emit(state.copyWith(currentLocale: selectedLocale));
  }

  /// Change app locale.
  void changeAppLocale(Locale locale) {
    if (!AppLanguages.isSupported(locale)) {
      throw ArgumentError(
        'Locale $locale is not supported. '
        'Supported locales: ${AppLanguages.supportedLocales}',
      );
    }
    log('Change locale to ${locale.languageCode} success');
    if (locale.languageCode != state.currentLocale.languageCode ||
        locale.countryCode != state.currentLocale.countryCode) {
      _prefsRepo.saveLocale(locale);

      emit(state.copyWith(currentLocale: locale));
    }
  }

  void switchLanguage() {
    if (state.currentLocale.languageCode == 'vi') {
      changeAppLocale(AppLanguages.supportedLocales.first);
      return;
    }
    changeAppLocale(AppLanguages.supportedLocales[1]);
  }
}
