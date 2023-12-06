import 'package:minimalist_bloc_clean_architecture/base/bloc/bloc.dart';

class BottomBarState extends BaseStateApp {
  final int currentIndex;
  const BottomBarState(this.currentIndex);

  BottomBarState copyWith({int? currentIndex}) {
    return BottomBarState(currentIndex ?? this.currentIndex);
  }

  @override
  List<Object> get props => [currentIndex];
}