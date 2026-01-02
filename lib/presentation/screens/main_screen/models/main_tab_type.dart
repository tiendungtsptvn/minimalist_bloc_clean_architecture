import 'package:flutter/material.dart';
import 'package:minimalist_bloc_clean_architecture/l10n/generated/l10n.dart';
import 'package:minimalist_bloc_clean_architecture/resource/gen/assets.gen.dart';

/// Tab types enum for type safety.
enum MainTabType {
  home,
  calendar,
  focuses,
  profile,
}

/// Extension for MainTabType to get index value.
extension MainTabTypeExtension on MainTabType {
  /// Get index value for the tab type.
  int get tabValue {
    switch (this) {
      case MainTabType.home:
        return 0;
      case MainTabType.calendar:
        return 1;
      case MainTabType.focuses:
        return 2;
      case MainTabType.profile:
        return 3;
    }
  }

  /// Get MainTabType from index.
  static MainTabType? fromIndex(int index) {
    switch (index) {
      case 0:
        return MainTabType.home;
      case 1:
        return MainTabType.calendar;
      case 2:
        return MainTabType.focuses;
      case 3:
        return MainTabType.profile;
      default:
        return null;
    }
  }

  /// Get icon for the tab type.
  SvgGenImage get icon {
    switch (this) {
      case MainTabType.home:
        return Assets.images.solid.homeIcon;
      case MainTabType.calendar:
        return Assets.images.solid.calendarIcon;
      case MainTabType.focuses:
        return Assets.images.solid.clockIcon;
      case MainTabType.profile:
        return Assets.images.solid.userIcon;
    }
  }

  /// Get label for the tab type.
  String getLabel(BuildContext context) {
    switch (this) {
      case MainTabType.home:
        return AppLocale.of(context).home;
      case MainTabType.calendar:
        return AppLocale.of(context).calendar;
      case MainTabType.focuses:
        return AppLocale.of(context).focuses;
      case MainTabType.profile:
        return AppLocale.of(context).profile;
    }
  }
}
