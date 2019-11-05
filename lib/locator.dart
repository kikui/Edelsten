import 'package:edelsten/core/repositories/stone_repository.dart';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/viewmodels/stones_model.dart';
import 'package:get_it/get_it.dart';
import 'core/repositories/user_repository.dart';
import 'core/viewmodels/stone_model.dart';
import 'core/viewmodels/viewmodel.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerFactory(() => LoginModel());
  locator.registerLazySingleton(() => StoneRepository());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerFactory(() => StonesModel());
  locator.registerFactory(() => StoneModel());
}
