import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/app/bloc/app_bloc.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/main_screen/main_screen.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/shared_view/bottom_bar/bloc/bottom_bar_bloc.dart';
import 'package:minimalist_bloc_clean_architecture/resource/style/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppBloc appBloc;

  @override
  void initState() {
    appBloc = AppBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: appBloc,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            home: MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => BottomBarCubit()),
                ],
                child: const MainScreen()
            ),
          );
        }
      ),
    );
  }
}
