import 'package:flutter/material.dart';
import 'package:minimalist_bloc_clean_architecture/resource/gen/fonts.gen.dart';
import 'app_colors.dart';

/// Define custom themes.
///

enum AppThemeType { light, dark }

/// Light theme
final lightTheme = ThemeData(
  brightness: Brightness.light,
  splashColor: Colors.transparent,
  fontFamily: FontFamily.lato,
)..addAppColor(
    AppThemeType.light,
    AppColors.lightThemeColor,
  );

/// Dark theme
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  splashColor: Colors.transparent,
  fontFamily: FontFamily.lato,
  scaffoldBackgroundColor: AppColors.darkThemeColor.primaryBackgroundColor,
)..addAppColor(
    AppThemeType.dark,
    AppColors.darkThemeColor,
  );

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
