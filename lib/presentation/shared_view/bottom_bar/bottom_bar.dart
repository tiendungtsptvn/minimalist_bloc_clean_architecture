import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/shared_view/bottom_bar/bottom_bar.dart';
import 'package:minimalist_bloc_clean_architecture/resource/style/app_colors.dart';

export 'bloc/bottom_bar_bloc.dart';

class BottomBarApp extends StatelessWidget {
  const BottomBarApp({super.key, required this.tabIndex});
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    final BottomBarCubit bottomBarCubit =
        BlocProvider.of<BottomBarCubit>(context);
    return BottomAppBar(
      height: 70,
      color: AppColors.current.secondaryBackgroundColor,
      shape: const CircularNotchedRectangle(), // Shape of notch
      notchMargin: 5, // Notch margin between floating button and bottom appbar
      child: Row(
        // Children inside bottom appbar
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(),
          IconButton(
            icon: Icon(
              Icons.menu,
              color: (tabIndex == 0) ? Colors.blue : Colors.white,
            ),
            onPressed: () {
              bottomBarCubit.setCurrentIndex(0);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: (tabIndex == 1) ? Colors.blue : Colors.white,
            ),
            onPressed: () {
              bottomBarCubit.setCurrentIndex(1);
            },
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            icon: Icon(
              Icons.print,
              color: (tabIndex == 2) ? Colors.blue : Colors.white,
            ),
            onPressed: () {
              bottomBarCubit.setCurrentIndex(2);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.people,
              color: (tabIndex == 3) ? Colors.blue : Colors.white,
            ),
            onPressed: () {
              bottomBarCubit.setCurrentIndex(3);
            },
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
