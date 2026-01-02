import 'dart:ui';
import '../../../resource/style/app_themes.dart';
import '../base/bloc/base_state_app.dart';

class GlobalAppState extends BaseStateApp {
  final Locale currentLocale;
  final AppTheme currentTheme;

  const GlobalAppState({
    required this.currentLocale,
    this.currentTheme = AppTheme.light,
  });

  GlobalAppState copyWith({
    Locale? currentLocale,
    AppTheme? currentTheme,
  }) {
    return GlobalAppState(
      currentLocale: currentLocale ?? this.currentLocale,
      currentTheme: currentTheme ?? this.currentTheme,
    );
  }

  @override
  List<Object?> get props => [currentLocale, currentTheme];
}
