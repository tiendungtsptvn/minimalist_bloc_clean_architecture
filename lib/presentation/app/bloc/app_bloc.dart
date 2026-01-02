import '../base/bloc/base_cubit_app.dart';
import 'app_state.dart';

export 'app_state.dart';

/// Bloc for managing global app state.
class GlobalAppCubit extends BaseCubitApp<GlobalAppState> {
  GlobalAppCubit() : super(const GlobalAppState());

  void init() {}
}
