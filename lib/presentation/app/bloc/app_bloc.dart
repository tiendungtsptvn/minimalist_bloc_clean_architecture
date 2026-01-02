import 'package:minimalist_bloc_clean_architecture/core/base/bloc/bloc.dart';
import 'app_state.dart';

export 'app_state.dart';

/// Bloc for managing global app state.
class GlobalAppCubit extends BaseCubitApp<GlobalAppState> {
  GlobalAppCubit() : super(const GlobalAppState());

  void init() {}
}
