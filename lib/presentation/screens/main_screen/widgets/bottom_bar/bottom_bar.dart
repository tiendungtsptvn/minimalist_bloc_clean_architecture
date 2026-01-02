import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/app/base/widgets/base_screen_app.dart';
import 'package:minimalist_bloc_clean_architecture/resource/style/app_colors.dart';
import '../../models/main_tab_type.dart';

import 'bloc/bottom_bar_bloc.dart';

export 'bloc/bottom_bar_bloc.dart';

class BottomBarApp extends AppStateless {
  const BottomBarApp({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        final bottomBarCubit = context.read<BottomBarCubit>();
        final currentTab = state.currentTab;
        return BottomAppBar(
          height: 70.r,
          padding: EdgeInsets.symmetric(vertical: 10.r),
          color: AppColors.current.secondaryBackgroundColor,
          shape: const CircularNotchedRectangle(),
          notchMargin: 5.r,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(),
              _buildTabItem(
                context: context,
                cubit: bottomBarCubit,
                tabType: MainTabType.home,
                isSelected: currentTab == MainTabType.home,
              ),
              _buildTabItem(
                context: context,
                cubit: bottomBarCubit,
                tabType: MainTabType.calendar,
                isSelected: currentTab == MainTabType.calendar,
              ),
              SizedBox(width: 20.r),
              _buildTabItem(
                context: context,
                cubit: bottomBarCubit,
                tabType: MainTabType.focuses,
                isSelected: currentTab == MainTabType.focuses,
              ),
              _buildTabItem(
                context: context,
                cubit: bottomBarCubit,
                tabType: MainTabType.profile,
                isSelected: currentTab == MainTabType.profile,
              ),
              const SizedBox(),
            ],
          ),
        );
      }
    );
  }

  Widget _buildTabItem({
    required BuildContext context,
    required BottomBarCubit cubit,
    required MainTabType tabType,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () => cubit.setTab(tabType),
      borderRadius: BorderRadius.circular(5.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          tabType.icon.svg(
            colorFilter: ColorFilter.mode(
              isSelected
                  ? AppColors.current.primaryColor
                  : AppColors.current.primaryTextColor,
              BlendMode.srcIn,
            ),
            width: 22.r,
            height: 22.r,
          ),
          SizedBox(height: 5.r),
          Text(
            tabType.getLabel(context),
            style: TextStyle(
              color: isSelected
                  ? AppColors.current.primaryColor
                  : AppColors.current.primaryTextColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
