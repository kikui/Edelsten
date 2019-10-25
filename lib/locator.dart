import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/services/repository_user.dart';
import 'package:edelsten/core/viewmodels/stones_model.dart';
import 'package:get_it/get_it.dart';
import 'core/article_repository/article_repository.dart';
import 'core/viewmodels/viewmodel.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerFactory(() => LoginModel());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => RepositoryUser());
  locator.registerFactory(() => StonesModel());
}
