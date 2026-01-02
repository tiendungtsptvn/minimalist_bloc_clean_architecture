import 'package:flutter/material.dart';
import 'package:minimalist_bloc_clean_architecture/resource/gen/fonts.gen.dart';
import 'app_colors.dart';

/// Theme types supported by the app.
enum AppTheme {
  light,
  dark,
  // Add new theme types here
}

/// Theme registry for managing all app themes.
class AppThemeRegistry {
  static final Map<AppTheme, ThemeData> _themes = {};
  static final Map<AppTheme, AppColors> _colors = {};

  /// Register a theme.
  static void registerTheme(
    AppTheme type,
    ThemeData themeData,
    AppColors appColors,
  ) {
    _themes[type] = themeData..addAppColor(type, appColors);
    _colors[type] = appColors;
  }

  /// Get theme data by type.
  static ThemeData? getTheme(AppTheme type) {
    return _themes[type];
  }

  /// Get app colors by type.
  static AppColors? getColors(AppTheme type) {
    return _colors[type];
  }

  /// Get all registered theme types.
  static List<AppTheme> getAvailableThemes() {
    return _themes.keys.toList();
  }

  /// Initialize default themes (light and dark).
  static void initializeDefaultThemes() {
    // Light theme
    final lightTheme = ThemeData(
      brightness: Brightness.light,
      splashColor: Colors.transparent,
      fontFamily: FontFamily.lato,
    );

    // Dark theme
    final darkTheme = ThemeData(
      brightness: Brightness.dark,
      splashColor: Colors.transparent,
      fontFamily: FontFamily.lato,
      scaffoldBackgroundColor: AppColors.darkThemeColor.primaryBackgroundColor,
    );

    registerTheme(AppTheme.light, lightTheme, AppColors.lightThemeColor);
    registerTheme(AppTheme.dark, darkTheme, AppColors.darkThemeColor);
  }
}

extension ThemeDataExtensions on ThemeData {
  static final Map<AppTheme, AppColors> _appColorMap = {};

  /// Add app color for new theme.
  void addAppColor(AppTheme type, AppColors appColor) {
    _appColorMap[type] = appColor;
  }

  /// Get app color for current theme.
  AppColors get appColor {
    return _appColorMap[AppThemeSetting.currentAppThemeType] ??
        AppColors.darkThemeColor;
  }
}

class AppThemeSetting {
  const AppThemeSetting._();
  static AppTheme currentAppThemeType = AppTheme.light;
}
