
import 'dart:async';
import 'package:edelsten/core/article_repository/article_repository.dart';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/locator.dart';

class AuthenticationService  {
  
  StreamController<User> userController = StreamController<User>();
  Api _api = locator<Api>();

  Future<bool> login (String identifier, String password) async {
    
    var firebaseUser;
    firebaseUser = await _api.loginUser(email: identifier, password: password);

    User fetcheduser;
    if (firebaseUser != null){
       //fetcheduser = await _api.getUserData(firebaseUser.uid);
       fetcheduser = User.initial();
    }
    var hasUser = fetcheduser != null;
    if (hasUser) {
      userController.add(fetcheduser);
    }
    return hasUser;
  }
}