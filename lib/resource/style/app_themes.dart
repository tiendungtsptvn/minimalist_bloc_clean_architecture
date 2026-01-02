import 'package:flutter/material.dart';
import 'package:minimalist_bloc_clean_architecture/resource/gen/fonts.gen.dart';
import 'app_colors.dart';

/// Theme types supported by the app.
enum AppThemeType {
  light,
  dark,
  // Add new theme types here
}

/// Theme registry for managing all app themes.
class AppThemeRegistry {
  static final Map<AppThemeType, ThemeData> _themes = {};
  static final Map<AppThemeType, AppColors> _colors = {};

  /// Register a theme.
  static void registerTheme(
    AppThemeType type,
    ThemeData themeData,
    AppColors appColors,
  ) {
    _themes[type] = themeData..addAppColor(type, appColors);
    _colors[type] = appColors;
  }

  /// Get theme data by type.
  static ThemeData? getTheme(AppThemeType type) {
    return _themes[type];
  }

  /// Get app colors by type.
  static AppColors? getColors(AppThemeType type) {
    return _colors[type];
  }

  /// Get all registered theme types.
  static List<AppThemeType> getAvailableThemes() {
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

    registerTheme(AppThemeType.light, lightTheme, AppColors.lightThemeColor);
    registerTheme(AppThemeType.dark, darkTheme, AppColors.darkThemeColor);
  }
}

extension ThemeDataExtensions on ThemeData {
  static final Map<AppThemeType, AppColors> _appColorMap = {};

  /// Add app color for new theme.
  void addAppColor(AppThemeType type, AppColors appColor) {
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
  static AppThemeType currentAppThemeType = AppThemeType.light;
}
