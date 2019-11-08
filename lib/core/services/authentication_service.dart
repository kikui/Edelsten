import 'dart:async';
import 'dart:core';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/repositories/user_repository.dart';
import 'package:edelsten/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService  {
  
  StreamController<User> userController = StreamController<User>();
  Stream<User> userStream;
  UserRepository _userRepository = locator<UserRepository>();

  Future<bool> login(String identifier, String password) async {
    
    FirebaseUser firebaseUser;
    firebaseUser = await _userRepository.loginUser(email: identifier, password: password);
    User user;
    var hasUser = false;
    
    if (firebaseUser != null){
      userStream = _userRepository.getUserDataStream(firebaseUser.uid);
      userStream.listen((User userFromStream) {
        userController.add(user);
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
  }

  Future<bool> logout() async{
    try{
      await _userRepository.loginOut();
      userStream = null;
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

  void dispose() {
    userController.close();
  }
}