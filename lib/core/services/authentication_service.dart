import 'dart:async';
import 'dart:core';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/repositories/user_repository.dart';
import 'package:edelsten/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AuthenticationService {
  FirebaseAnalytics analytics = FirebaseAnalytics();
  StreamController<User> userController = BehaviorSubject();
  Stream<User> userStream;
  UserRepository _userRepository = locator<UserRepository>();
  User user;

  Future<bool> login(String identifier, String password) async {
    FirebaseUser firebaseUser;
    firebaseUser =
        await _userRepository.loginUser(email: identifier, password: password);
    var hasUser = false;

    if (firebaseUser != null) {
      hasUser = await getUserData(firebaseUser.uid);
    }
    return hasUser;
  }

  Future<bool> logout() async {
    try {
      await _userRepository.loginOut();
      userStream = null;
      userController.add(null);
      user = null;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(
      String identifier, String password, String pseudo) async {
    FirebaseUser firebaseUser;
    firebaseUser = await _userRepository.registerUser(
        email: identifier, password: password);
    User userData = new User(firebaseUser.uid, pseudo, false);
    var hasUser = false;
    if (firebaseUser != null) {
      _userRepository.createUserData(userData);
      hasUser = await getUserData(firebaseUser.uid);
    }
    return hasUser;
  }

  //Récupère les datas de l'utilisateur dans un flux 
  Future<bool> getUserData(String uuidUser) async {
    user = await _userRepository.getUserData(uuidUser);
    userStream = _userRepository.getUserDataStream(uuidUser);
    userStream.listen((User userFromStream) {
      user = userFromStream;
      userController.add(userFromStream);
    });

    var hasUser = user != null;
    if (hasUser) {
      userController.add(user);
      return hasUser;
    } else {
      logout();
      return hasUser;
    }
  }
}
