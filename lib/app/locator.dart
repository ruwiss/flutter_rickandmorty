import 'package:get_it/get_it.dart';
import 'package:rickandmorty/services/api_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<ApiService>(() => ApiService());
}
