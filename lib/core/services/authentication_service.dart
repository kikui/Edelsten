
import 'dart:async';
import 'dart:core';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/repositories/user_repository.dart';
import 'package:edelsten/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService  {
  
  StreamController<User> userController = StreamController<User>();
  UserRepository _userRepository = locator<UserRepository>();

  Future<bool> login (String identifier, String password) async {
    
    FirebaseUser firebaseUser;
    firebaseUser = await _userRepository.loginUser(email: identifier, password: password);
    User userData;
    
    if (firebaseUser != null){
      userData = await _userRepository.getUserData(firebaseUser.uid);
    }
    var hasUser = userData != null;
    if (hasUser) {
      userController.add(userData);
    }
    return hasUser;
  }
}