import 'dart:async';
import 'dart:core';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/repositories/user_repository.dart';
import 'package:edelsten/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AuthenticationService  {
  
  StreamController<User> userController = BehaviorSubject();
  Stream<User> userStream;
  UserRepository _userRepository = locator<UserRepository>();
  User user;

  Future<bool> login(String identifier, String password) async {
    
    FirebaseUser firebaseUser;
    firebaseUser = await _userRepository.loginUser(email: identifier, password: password);
    var hasUser = false;
    
    if (firebaseUser != null){
      userStream = _userRepository.getUserDataStream(firebaseUser.uid);
      userStream.listen((User userFromStream) {
        user = userFromStream;
        userController.add(userFromStream);
      });

      user = await _userRepository.getUserData(firebaseUser.uid);
      hasUser = user != null;
      if (hasUser) {
        userController.add(user);
        return hasUser;
      } else {
        logout(); 
        return hasUser;
      }
    }
    return hasUser;
  }

  Future<bool> logout() async{
    try{
      await _userRepository.loginOut();
      userStream = null;
      userController.add(null);
      user = null;
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
      // userController.add(userData);
    }
    return hasUser;
  }
}