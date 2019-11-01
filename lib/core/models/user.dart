import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edelsten/core/models/book.dart';

class User {
  String id;
  String pseudo;
  bool administrator;
  List<dynamic> favorites = List();
  List<Book> books = List();
  
  User.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    pseudo = snapshot['pseudo'];
    administrator = snapshot['administrator'];
    favorites = snapshot['favorites'];
  }

  String toString(){
    var result = 'id: ' + id + ' | pseudo: ' + pseudo + ' | admin: ' + administrator.toString() + ' | favorites : [';
    favorites.forEach((e) => {
      result += e.toString() + ', '
    });
    result += ']';
    return result;
  }

  User(String id, String pseudo, bool admin){
    this.id = id;
    this.pseudo = pseudo;
    this.administrator = admin;
  }

  User.initial(){
    id = '0';
    pseudo = '';
    administrator = false;
  }
}