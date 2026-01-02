import '../../../../../app/base/bloc/base_cubit_app.dart';
import '../../../models/main_tab_type.dart';
import 'bottom_bar_state.dart';

export 'bottom_bar_state.dart';

class BottomBarCubit extends BaseCubitApp<BottomBarState> {
  BottomBarCubit() : super(const BottomBarState());

  /// Change to specific tab.
  void setTab(MainTabType tabType) {
    if (state.currentTab != tabType) {
      emit(state.copyWith(currentTab: tabType));
    }
  }

  /// Change tab by index (backward compatibility).
  void setCurrentIndex(int index) {
    final tabType = MainTabTypeExtension.fromIndex(index);
    if (tabType != null) {
      setTab(tabType);
    }
  }

  /// Handle page changed from PageView.
  void onPageChanged(int index) {
    final tabType = MainTabTypeExtension.fromIndex(index);
    if (tabType != null && state.currentTab != tabType) {
      emit(state.copyWith(currentTab: tabType));
    }
  }
}
