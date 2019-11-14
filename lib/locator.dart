import 'package:edelsten/core/repositories/comment_repository.dart';
import 'package:edelsten/core/repositories/stone_repository.dart';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/viewmodels/parameters_model.dart';
import 'package:edelsten/core/viewmodels/stones_model.dart';
import 'package:edelsten/core/viewmodels/comments_model.dart';
import 'package:get_it/get_it.dart';
import 'core/repositories/user_repository.dart';
import 'core/viewmodels/stone_model.dart';
import 'core/viewmodels/viewmodel.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => StoneRepository());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => CommentRepository());
  locator.registerFactory(() => FavoritesModel());
  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => RegisterModel());
  locator.registerFactory(() => StonesModel());
  locator.registerFactory(() => StoneModel());
  locator.registerFactory(() => CommentModel());
  locator.registerFactory(() => ParametersModel());
}
