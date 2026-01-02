import 'package:minimalist_bloc_clean_architecture/resource/style/app_themes.dart';

import '../base/bloc/base_state_app.dart';

class ThemeState extends BaseStateApp {
  final AppThemeType currentTheme;

  const ThemeState({this.currentTheme = AppThemeType.light});

  ThemeState copyWith({AppThemeType? currentTheme}) {
    return ThemeState(
      currentTheme: currentTheme ?? this.currentTheme,
    );
  }

  @override
  List<Object?> get props => [currentTheme];
}
