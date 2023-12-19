import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/shared_view/bottom_bar/bottom_bar.dart';
import 'package:minimalist_bloc_clean_architecture/resource/gen/assets.gen.dart';
import 'package:minimalist_bloc_clean_architecture/resource/gen/locale_keys.g.dart';
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
      height: 70.r,
      padding: EdgeInsets.symmetric(vertical: 10.r),
      color: AppColors.current.secondaryBackgroundColor,
      shape: const CircularNotchedRectangle(), // Shape of notch
      notchMargin: 5.r, // Notch margin between floating button and bottom appbar
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(),
          InkWell(
            onTap: () {
              bottomBarCubit.setCurrentIndex(0);
            },
            borderRadius: BorderRadius.circular(5.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.images.homeIcon.svg(
                  colorFilter: ColorFilter.mode(
                      (tabIndex == 0)
                          ? AppColors.current.primaryColor
                          : AppColors.current.primaryTextColor,
                      BlendMode.srcIn),
                  width: 22.r,
                  height: 22.r,
                ),
                SizedBox(
                  height: 5.r,
                ),
                Text(
                  LocaleKeys.home.tr(),
                  style: TextStyle(
                    color: (tabIndex == 0)
                        ? AppColors.current.primaryColor
                        : AppColors.current.primaryTextColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              bottomBarCubit.setCurrentIndex(1);
            },
            borderRadius: BorderRadius.circular(5.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.images.calendarIcon.svg(
                  colorFilter: ColorFilter.mode(
                      (tabIndex == 1)
                          ? AppColors.current.primaryColor
                          : AppColors.current.primaryTextColor,
                      BlendMode.srcIn),
                  width: 22.r,
                  height: 22.r,
                ),
                SizedBox(
                  height: 5.r,
                ),
                Text(
                  LocaleKeys.calendar.tr(),
                  style: TextStyle(
                    color: (tabIndex == 1)
                        ? AppColors.current.primaryColor
                        : AppColors.current.primaryTextColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.r,
          ),
          InkWell(
            onTap: () {
              bottomBarCubit.setCurrentIndex(2);
            },
            borderRadius: BorderRadius.circular(5.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.images.clockIcon.svg(
                  colorFilter: ColorFilter.mode(
                      (tabIndex == 2)
                          ? AppColors.current.primaryColor
                          : AppColors.current.primaryTextColor,
                      BlendMode.srcIn),
                  width: 22.r,
                  height: 22.r,
                ),
                SizedBox(
                  height: 5.r,
                ),
                Text(
                  LocaleKeys.focuses.tr(),
                  style: TextStyle(
                    color: (tabIndex == 2)
                        ? AppColors.current.primaryColor
                        : AppColors.current.primaryTextColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              bottomBarCubit.setCurrentIndex(3);
            },
            borderRadius: BorderRadius.circular(5.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.images.userIcon.svg(
                  colorFilter: ColorFilter.mode(
                      (tabIndex == 3)
                          ? AppColors.current.primaryColor
                          : AppColors.current.primaryTextColor,
                      BlendMode.srcIn),
                  width: 22.r,
                  height: 22.r,
                ),
                SizedBox(
                  height: 5.r,
                ),
                Text(
                  LocaleKeys.profile.tr(),
                  style: TextStyle(
                    color: (tabIndex == 3)
                        ? AppColors.current.primaryColor
                        : AppColors.current.primaryTextColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
