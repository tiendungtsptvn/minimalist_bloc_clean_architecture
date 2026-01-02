import 'package:get_it/get_it.dart';
import 'package:minimalist_bloc_clean_architecture/data/repositories/repositories.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/app/locale/locale_cubit.dart';
import 'package:minimalist_bloc_clean_architecture/presentation/app/theme/theme_cubit.dart';
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

  // Register Cubits
  getIt.registerFactory<ThemeCubit>(
    () => ThemeCubit(getIt<PreferencesRepository>()),
  );
  getIt.registerFactory<LocaleCubit>(
    () => LocaleCubit(getIt<PreferencesRepository>()),
  );
}
