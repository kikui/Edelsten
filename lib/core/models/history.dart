import 'package:cloud_firestore/cloud_firestore.dart';

class History{
 String description;
 String period;
 String title;

 History({this.description, this.period, this.title});

 History.fromSnapshot(DocumentSnapshot snapshot){
    title = snapshot['title'];
    description = snapshot['description'];
    period = snapshot['period'];
  }
}