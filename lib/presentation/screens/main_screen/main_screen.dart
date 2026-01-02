import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/app/locale/locale_cubit.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/app/theme/theme_cubit.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/calendar/calendar.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/focuses/focuses.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/home/home.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/profile/profile.dart';
import 'package:minimalist_bloc_clean_architecture/resource/style/app_colors.dart';

import '../../app/base/widgets/base_screen_app.dart';
import 'bottom_bar/bottom_bar.dart';

/// Main Screen of the app.
///
/// Include bottom app bar.
///
class MainScreen extends AppStateless {
  const MainScreen({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomBarCubit(),
      child: const MainScreenBody(),
    );
  }
}

class MainScreenBody extends AppStateful {
  const MainScreenBody({super.key});

  @override
  State<MainScreenBody> createState() => _MainScreenBodyState();
}

final mainTabsApp = [
  const HomeScreen(),
  const CalendarScreen(),
  const FocusesScreen(),
  const ProfileScreen(),
];

class _MainScreenBodyState extends AppStatefulState<MainScreenBody> {
  bool _localeInitialized = false;
  bool _themeInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialize locale only once after EasyLocalization is ready
    if (!_localeInitialized) {
      _localeInitialized = true;
      context.read<LocaleCubit>().initLocale();
    }

    // Initialize theme only once
    if (!_themeInitialized) {
      _themeInitialized = true;
      context.read<ThemeCubit>().initTheme();
    }
  }

  @override
  Widget buildScreen(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, bottomBarState) {
        return Scaffold(
          body: mainTabsApp.elementAt(bottomBarState.currentIndex),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.current.primaryColor,
            foregroundColor: Colors.white,
            shape: const CircleBorder(),
            onPressed: () {
              //code to execute on button press
            },
            child: const Icon(Icons.send),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar:
              BottomBarApp(tabIndex: bottomBarState.currentIndex),
        );
      },
    );
  }
}
