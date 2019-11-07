import 'dart:async';
import 'dart:core';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/repositories/user_repository.dart';
import 'package:edelsten/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService  {
  
  StreamController<User> userController = StreamController<User>();
  UserRepository _userRepository = locator<UserRepository>();

  Future<bool> login(String identifier, String password) async {
    
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
    else{
      _userRepository.loginOut();
    }
    return hasUser;
  }

  Future<bool> logout() async{
    try{
      await _userRepository.loginOut();
      userController.add(null);
      return true;
    }
    catch(e){
      return false;
    }
  }

  Future<bool> register(String identifier, String password, String pseudo) async {
    FirebaseUser firebaseUser;
    firebaseUser = await _userRepository.registerUser(email: identifier, password: password);
    User userData = new User(firebaseUser.uid, pseudo, false);
    
    if (firebaseUser != null){
     _userRepository.createUserData(userData);
    }
    var hasUser = userData != null;
    if (hasUser) {
      userController.add(userData);
    }
    return hasUser;
  }
}