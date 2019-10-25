import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edelsten/core/models/book.dart';

class User {
  String id;
  String pseudo;
  bool administrator;
  List<String> favorites = List();
  List<Book> books = List();
  
  User.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    pseudo = snapshot['pseudo'];
    administrator = snapshot['administrator'];
    favorites = snapshot['favorites'];
    snapshot['books'].foreach((e) => {
      books.add(Book.fromSnapshot(e))
    });
  }

  User.initial(){
    id = '0';
    pseudo = '';
    administrator = false;
  }
}