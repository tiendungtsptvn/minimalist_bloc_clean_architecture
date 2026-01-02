import 'package:equatable/equatable.dart';

class BottomBarState extends Equatable {
  final int currentIndex;
  const BottomBarState(this.currentIndex);

  BottomBarState copyWith({int? currentIndex}) {
    return BottomBarState(currentIndex ?? this.currentIndex);
  }

  @override
  List<Object> get props => [currentIndex];
}
