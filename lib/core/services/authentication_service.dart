
import 'package:edelsten/core/article_repository/article_repository.dart';
import 'package:edelsten/locator.dart';

class AuthenticationService  {
  
  Api _api = locator<Api>();

  Future<bool> login (String identifier, String password) async {
    var fetcheduser = await _api.getUserProfile(identifier, password);
    // Check if success
    var hasUser = fetcheduser != null;
    return hasUser;
  }
}