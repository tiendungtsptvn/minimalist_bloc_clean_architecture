import 'package:minimalist_bloc_clean_architecture/base/bloc/bloc.dart';

class AppState extends BaseStateApp {
  final bool isDarkTheme;
  const AppState({required this.isDarkTheme});

  copyWith({bool? isDarkTheme}) {
    return AppState(isDarkTheme: isDarkTheme ?? this.isDarkTheme);
  }

  @override
  List<Object?> get props => [isDarkTheme];
}
