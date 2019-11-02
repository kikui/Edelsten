import 'package:cloud_firestore/cloud_firestore.dart';

class History{
 String description;
 String period;
 String title;

 History({this.description, this.period, this.title});

 History.fromDocumentReference(DocumentReference docReference){
   var document =  docReference.get();
 }
}