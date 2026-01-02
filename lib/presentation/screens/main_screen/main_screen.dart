import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/app/locale/locale_cubit.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/app/theme/theme_cubit.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/calendar/calendar.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/focuses/focuses.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/home/home.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/main_screen/models/main_tab_type.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/main_screen/widgets/bottom_bar/bottom_bar.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/profile/profile.dart';
import 'package:minimalist_bloc_clean_architecture/resource/style/app_colors.dart';

import '../../app/base/widgets/base_screen_app.dart';

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

class _MainScreenBodyState extends AppStatefulState<MainScreenBody> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: MainTabType.home.tabValue,
    );
    context.read<LocaleCubit>().initLocale();
    context.read<ThemeCubit>().initTheme();
  }

  @override
  Widget buildScreen(BuildContext context) {
    return BlocListener<BottomBarCubit, BottomBarState>(
      listenWhen: (previous, current) =>
          previous.currentTab != current.currentTab,
      listener: (context, state) {
        // Handle page change when state changes
        if (_pageController.hasClients) {
          final targetIndex = state.currentTab.tabValue;
          _pageController.jumpToPage(targetIndex);
        }
      },
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(), // Disable swipe
          controller: _pageController,
          onPageChanged: context.read<BottomBarCubit>().onPageChanged,
          children: const [
            HomeScreen(),
            CalendarScreen(),
            FocusesScreen(),
            ProfileScreen(),
          ],
        ),
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
        bottomNavigationBar: const BottomBarApp(),
      ),
    );
  }
}
