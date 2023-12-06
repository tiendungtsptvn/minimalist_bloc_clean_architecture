import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimalist_bloc_clean_architecture/base/widgets/base_screen_app.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/calendar/calendar.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/focuses/focuses.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/home/home.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/screens/profile/profile.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/shared_view/bottom_bar/bottom_bar.dart';

/// Main Screen of the app.
///
/// Include bottom app bar.
class MainScreen extends BaseScreenApp {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final mainTabsApp = [
  const HomeScreen(),
  const CalendarScreen(),
  const FocusesScreen(),
  const ProfileScreen(),
];

class _MainScreenState extends BaseScreenAppState<MainScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, bottomBarState) {
        return Scaffold(
          body: mainTabsApp.elementAt(bottomBarState.currentIndex),
          floatingActionButton: FloatingActionButton(
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
