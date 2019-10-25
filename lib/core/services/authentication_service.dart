
import 'dart:async';
import 'dart:core';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/services/user_repository.dart';
import 'package:edelsten/locator.dart';

class AuthenticationService  {
  
  StreamController<User> userController = StreamController<User>();
  UserRepository _userRepository = locator<UserRepository>();

  Future<bool> login (String identifier, String password) async {
    
    var firebaseUser;
    firebaseUser = await _userRepository.loginUser(email: identifier, password: password);
    User userData;
    
    if (firebaseUser != null){
      userData = await _userRepository.getUserData(/*firebaseUser.uid*/"JzBpHeHWtqAFazpj5v0o");
      print('-------------------------------------------------------------userData');
      print(userData);
    }
    var hasUser = userData != null;
    if (hasUser) {
      print('-------------------------------------------------------------hasUserOK');
      userController.add(userData);
    }
    return hasUser;
  }
}