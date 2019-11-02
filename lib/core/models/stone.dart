import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edelsten/core/models/history.dart';

class Stone {
  String id;
  String title;
  String overview;
  String picture;
  String ethymology;
  String group;
  String chemicalComposition;
  String cristallineSystem;
  String hardness;
  String description;
  List<dynamic> countries = List<dynamic>();
  List<dynamic> histories = List<dynamic>();
  List<dynamic> pictures = List<dynamic>();

  Stone({
    this.id, 
    this.title, 
    this.overview, 
    this.picture,
    this.countries,
    this.ethymology,
    this.group,
    this.chemicalComposition,
    this.cristallineSystem,
    this.hardness,
    this.description,
    this.histories,
    this.pictures
  });

  Stone.fromSnapshot(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data['title'];
    overview = snapshot.data['overview'];
    description = snapshot.data['description'];
    hardness = snapshot.data['hardness'];
    group = snapshot.data['group'];
    cristallineSystem = snapshot.data['cristallineSystem'];
    chemicalComposition = snapshot.data['chemicalComposition'];
    countries = snapshot.data['countries'];
    ethymology = snapshot.data['ethymology'];

    List<dynamic> histories = List<dynamic>();
    for (var historyDocReference in snapshot.data["histories"]){
      var history = History.fromDocumentReference(historyDocReference);
      histories.add(history);
    }
    histories = histories;
  }
}