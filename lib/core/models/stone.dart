import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edelsten/core/models/model.dart';

class Stone {
  String id;
  String title;
  String overview;
  String ethymology;
  List<History> histories = new List();
  List<dynamic> pictures;
  List<dynamic> countries;
  String description;
  String hardness;
  String group;
  String cristallineSystem;
  String chemicalComposition;
  String defaultPicture;

  Stone.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot['title'];
    overview = snapshot['overview'];
    description = snapshot['description'];
    hardness = snapshot['hardness'];
    group = snapshot['group'];
    cristallineSystem = snapshot['cristallineSystem'];
    chemicalComposition = snapshot['chemicalComposition'];
    countries = new List<dynamic>.from(snapshot['countries']);
    pictures = new List<dynamic>.from(snapshot['pictures']);
    ethymology = snapshot['ethymology'];
    defaultPicture = snapshot['defaultPicture'];
  }

  String toString(){
    var result = 'id: ' + id + ' | title: ' + title + ' | overview: ' + overview + ' | stoneDescription: ' + 
      description + ' | hardness: ' + hardness + ' | group: ' + group + ' | cristallineSystem:' + 
      cristallineSystem + ' | chemicalComposition: ' + chemicalComposition + ' | etymology: ' + ethymology + ' | ';
    result+= 'countries: [';
    countries.forEach((e) => {
      result += e + ', '
    });
    result+= ']';
    return result;
  }

  Stone(String title){
    this.title = title;
  }
}
