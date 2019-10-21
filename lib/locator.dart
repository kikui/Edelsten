import 'package:get_it/get_it.dart';
import 'core/article_repository/article_repository.dart';
import 'core/viewmodels/viewmodel.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => Api());
}
