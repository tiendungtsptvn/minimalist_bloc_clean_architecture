import '../../../../../app/base/bloc/base_state_app.dart';
import '../../../models/main_tab_type.dart';

class BottomBarState extends BaseStateApp {
  final MainTabType currentTab;

  const BottomBarState({this.currentTab = MainTabType.home});

  BottomBarState copyWith({MainTabType? currentTab}) {
    return BottomBarState(
      currentTab: currentTab ?? this.currentTab,
    );
  }

  /// Get current tab index.
  int get currentIndex => currentTab.tabValue;

  @override
  List<Object?> get props => [currentTab];
}
