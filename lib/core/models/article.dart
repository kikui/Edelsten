import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edelsten/core/models/model.dart';

class Article {
  String id;
  String title;
  String overview;
  String etymology;
  List<History> histories = List();
  List<Picture> pictures = List();
  List<dynamic> countries = List();
  String stoneDescription;
  String hardness;
  String group;
  String crystallineSystem;
  String chemicalComposition;

  Article.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot['title'];
    overview = snapshot['overview'];
    stoneDescription = snapshot['description'];
    hardness = snapshot['hardness'];
    group = snapshot['group'];
    crystallineSystem = snapshot['crystallineSystem'];
    chemicalComposition = snapshot['chemicalComposition'];
    countries = snapshot['countries'];
    etymology = snapshot['etymology'];
  }

  String toString(){
    var result = 'id: ' + id + ' | title: ' + title + ' | overview: ' + overview + ' | stoneDescription: ' + 
      stoneDescription + ' | hardness: ' + hardness + ' | group: ' + group + ' | crystallineSystem:' + 
      crystallineSystem + ' | chemicalComposition: ' + chemicalComposition + ' | etymology: ' + etymology + ' | ';
    result+= 'countries: [';
    countries.forEach((e) => {
      result += e + ', '
    });
    result+= ']';
    return result;
  }
}
