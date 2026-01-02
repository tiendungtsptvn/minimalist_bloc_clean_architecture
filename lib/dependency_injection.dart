import 'package:get_it/get_it.dart';
import 'package:minimalist_bloc_clean_architecture/data/repositories/repositories.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/app/bloc/app_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Initialize dependency injection container.
Future<void> injectDependency() async {
  final getIt = GetIt.instance;

  // Register SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register Repositories
  getIt.registerSingleton<PreferencesRepository>(
    PreferencesRepository(getIt<SharedPreferences>()),
  );

  // Register GlobalAppCubit
  getIt.registerFactory<GlobalAppCubit>(
    () => GlobalAppCubit(getIt<PreferencesRepository>()),
  );
}
