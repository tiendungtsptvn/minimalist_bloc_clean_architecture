import 'package:minimalist_bloc_clean_architecture/base/bloc/bloc.dart';
import 'package:minimalist_bloc_clean_architecture/resource/style/app_themes.dart';
import 'app_state.dart';

export 'app_state.dart';

/// Bloc for manage state of global app.
///
/// Use for: theme, language, ...
class AppBloc extends BaseCubitApp<AppState> {
  AppBloc() : super(const AppState(isDarkTheme: false));

  void changeTheme() {
    _updateThemeSetting(!state.isDarkTheme);
    emit(state.copyWith(isDarkTheme: !state.isDarkTheme));
  }

  void _updateThemeSetting(bool isDarkTheme) {
    AppThemeSetting.currentAppThemeType =
        isDarkTheme ? AppThemeType.dark : AppThemeType.light;
  }
}
