import 'dart:async';
import 'dart:async' as prefix0;
import 'dart:core' ;

import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/models/stone.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Api {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  Future<FirebaseUser> loginUser({String email, String password}) async {
    var result  = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
    return result;
  }
  
  Future<List<Stone>> getAllStones() async {
    await Future.delayed(Duration(seconds: 1));
    return stones;
  }

  Future<User> getUserData(String uuid) async {
  }


  Future<User> getUserProfile(String identifier, String password) async {
    await Future.delayed(Duration(seconds: 1));
    if (identifier == "test" && password == "123")
      return User.initial();
    return null;
  }
}

var stones = [
  Stone(
      id: 0,
      title: 'Amethyst',
      overview: 'Protéger contre l\'ivresse',
      picture: 'amethyst.jpg'),
  Stone(
      id: 1,
      title: 'Obsidienne',
      overview: 'Quête de soi et de vérité',
      picture: 'obsidian.jpg'),
  Stone(
      id: 2,
      title: 'Emeraude',
      overview: 'Favorise l\'amitié',
      picture: 'emerald.jpg'),
  Stone(
      id: 3,
      title: 'Ruby',
      overview: 'Favorise l\'amitié',
      picture: 'ruby.jpg'),
  Stone(
      id: 4,
      title: 'Quartz',
      overview: 'Favorise l\'amitié',
      picture: 'quartz.jpg'),
];
