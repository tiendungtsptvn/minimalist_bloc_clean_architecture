import 'package:flutter/material.dart';
import 'app_themes.dart';

/// Manage app colors.
///
/// Define colors and theme for app in this class.
class AppColors {
  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.primaryBackgroundColor,
    required this.secondaryBackgroundColor,
    required this.primaryBackgroundItemColor,
    required this.secondaryBackgroundItemColor,
    required this.primaryBorderColor,
    required this.primaryGradient,
  });

  static late AppColors current;

  final Color primaryColor;
  final Color secondaryColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color primaryBackgroundColor;
  final Color secondaryBackgroundColor;
  final Color primaryBackgroundItemColor;
  final Color secondaryBackgroundItemColor;
  final Color primaryBorderColor;

  /// gradient
  final LinearGradient primaryGradient;

  static const darkThemeColor = AppColors(
    primaryColor: Color.fromARGB(255, 134, 135, 231),
    secondaryColor: Color.fromARGB(255, 62, 62, 70),
    primaryTextColor: Color.fromARGB(255, 255, 255, 255),
    secondaryTextColor: Color.fromARGB(255, 166, 168, 254),
    primaryBackgroundColor: Color.fromARGB(255, 18, 18, 18),
    secondaryBackgroundColor: Color.fromARGB(255, 54, 54, 54),
    primaryBackgroundItemColor: Color.fromARGB(255, 39, 39, 39),
    secondaryBackgroundItemColor: Color.fromARGB(255, 83, 83, 83),
    primaryBorderColor: Color.fromARGB(255, 151, 151, 151),
    primaryGradient: LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]),
  );

  static const lightThemeColor = AppColors(
    primaryColor: Color.fromARGB(
      255,
      134,
      135,
      231,
    ),
    secondaryColor: Color.fromARGB(255, 62, 62, 70),
    primaryTextColor: Color.fromARGB(255, 18, 18, 18),
    secondaryTextColor: Color.fromARGB(255, 166, 168, 254),
    primaryBackgroundColor: Color.fromARGB(255, 236, 236, 241),
    secondaryBackgroundColor: Color.fromARGB(255, 220, 218, 218),
    primaryBackgroundItemColor: Color.fromARGB(255, 217, 214, 214),
    secondaryBackgroundItemColor: Color.fromARGB(255, 159, 158, 158),
    primaryBorderColor: Color.fromARGB(255, 124, 124, 124),
    primaryGradient: LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]),
  );

  /// Init current color, call it when init app.
  static AppColors of(BuildContext context) {
    final appColor = Theme.of(context).appColor;

    current = appColor;

    return current;
  }

  AppColors copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? primaryBackgroundColor,
    Color? secondaryBackgroundColor,
    Color? primaryBackgroundItemColor,
    Color? secondaryBackgroundItemColor,
    Color? primaryBorderColor,
    LinearGradient? primaryGradient,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      primaryBackgroundColor: primaryBackgroundColor ?? this.primaryBackgroundColor,
      secondaryBackgroundColor: secondaryBackgroundColor ?? this.secondaryBackgroundColor,
      primaryBackgroundItemColor: primaryBackgroundItemColor ?? this.primaryBackgroundItemColor,
      secondaryBackgroundItemColor:
          secondaryBackgroundItemColor ?? this.secondaryBackgroundItemColor,
      primaryBorderColor: primaryBorderColor ?? this.primaryBorderColor,
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );
  }
}
