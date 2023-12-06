import 'package:minimalist_bloc_clean_architecture/base/bloc/bloc.dart';
import 'bottom_bar_state.dart';

export 'bottom_bar_state.dart';

class BottomBarCubit extends BaseCubitApp<BottomBarState> {
  BottomBarCubit() : super(const BottomBarState(0));

  void setCurrentIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
