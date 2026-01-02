import 'package:minimalist_bloc_clean_architecture/core/base/bloc/bloc.dart';
import 'package:minimalist_bloc_clean_architecture/data/repositories/repositories.dart';
import 'package:minimalist_bloc_clean_architecture/resource/style/app_themes.dart';
import 'theme_state.dart';

export 'theme_state.dart';

/// Cubit for managing app theme state.
class ThemeCubit extends BaseCubitApp<ThemeState> {
  final PreferencesRepository _prefsRepo;

  ThemeCubit(this._prefsRepo)
      : super(const ThemeState(currentTheme: AppThemeType.light));

  /// Initialize theme from SharedPreferences or default.
  Future<void> initTheme() async {
    final savedTheme = _prefsRepo.getTheme();
    if (savedTheme != null) {
      emit(state.copyWith(currentTheme: savedTheme));
      _updateThemeSetting(savedTheme);
      return;
    }

    // Use default theme
    const defaultTheme = AppThemeType.light;
    await _prefsRepo.saveTheme(defaultTheme);
    emit(state.copyWith(currentTheme: defaultTheme));
    _updateThemeSetting(defaultTheme);
  }

  /// Change theme to specific type.
  void setTheme(AppThemeType themeType) {
    if (state.currentTheme != themeType) {
      _prefsRepo.saveTheme(themeType);
      _updateThemeSetting(themeType);
      emit(state.copyWith(currentTheme: themeType));
    }
  }

  /// Toggle between light and dark (backward compatibility).
  void changeTheme() {
    final newTheme = state.currentTheme == AppThemeType.light
        ? AppThemeType.dark
        : AppThemeType.light;
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

  /// Update theme setting in AppThemeSetting.
  void _updateThemeSetting(AppThemeType themeType) {
    AppThemeSetting.currentAppThemeType = themeType;
  }
}
