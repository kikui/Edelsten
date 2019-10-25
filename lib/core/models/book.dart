import 'package:cloud_firestore/cloud_firestore.dart';

class Book{
  String title;
  String body;

  Book.fromSnapshot(DocumentSnapshot snapshot){
    title = snapshot['title'];
    body = snapshot['body'];
  }
}