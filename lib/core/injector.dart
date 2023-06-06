import 'package:get_it/get_it.dart';
import 'package:live_coding/data/data.dart';

final getIt = GetIt.instance;

void setupInjector() {
  getIt.registerLazySingleton(() => ConfigurationService());
  getIt.registerLazySingleton(() => MovieService());
  getIt.registerLazySingleton(() => AttributeService());
}
