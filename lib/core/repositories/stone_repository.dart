import 'dart:async';
import 'dart:core' ;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edelsten/core/models/model.dart';

const String STONES_STRING = 'stones';
const String STONES_HISTORIES = 'histories';

class StoneRepository {
  
  final Firestore dataBase = Firestore.instance;  

  // method get all stone
  Future<List<Stone>> getAllStones() async {
    var stoneList = new List<Stone>();  
    List<DocumentSnapshot> stonesSnapshot = (await dataBase.collection(STONES_STRING).getDocuments()).documents;
    stonesSnapshot.forEach((e) => {
      stoneList.add(Stone.fromSnapshot(e))
    });
    return stoneList;
  }

  // method get one stone
  Future<Stone> getOneStone(String uuidStone) async {
    CollectionReference collectionStoneReference = dataBase.collection(STONES_STRING);
    DocumentReference documentStoneReference = collectionStoneReference.document(uuidStone);
    DocumentSnapshot snapshotStone = await documentStoneReference.get();
    Stone stoneData = Stone.fromSnapshot(snapshotStone);

    Query collectionHistoriesReference = documentStoneReference.collection(STONES_HISTORIES);
    QuerySnapshot querySnapshot = await collectionHistoriesReference.getDocuments();
    List<DocumentSnapshot> historiesSnapshot = querySnapshot.documents;

    historiesSnapshot.forEach((e) => {
      stoneData.histories.add(History.fromSnapshot(e))
    });
    return stoneData;
  }

  // method get documentStone with stoneTitle | requete where
  Future<DocumentReference> getDocumentStoneByTitle(String stoneTitle) async {
    Query collectionTitleWhere = dataBase.collection(STONES_STRING).where('title', isEqualTo: stoneTitle);
    QuerySnapshot querySnapshot = await collectionTitleWhere.getDocuments();
    List<DocumentSnapshot> snapshot = querySnapshot.documents;
    DocumentReference stoneReference = dataBase.collection(STONES_STRING).document(snapshot.first.documentID);
    return stoneReference;
  }

  Future<bool> createStoneData(Stone stoneData) async {
    CollectionReference stoneCollectionReference = dataBase.collection(STONES_STRING);
    bool duplicateData = await checkStoneAlreadyExist(stoneData.title);
    if(duplicateData == true){
      return false;
    } 

    Map<String, dynamic> mapStoneData = transformStoneToMap(stoneData);
    await stoneCollectionReference.add(mapStoneData);

    DocumentReference documentReferenceStoneGetted = await getDocumentStoneByTitle(stoneData.title);
    Map historyMap = Map<String, dynamic>();
    historyMap['title'] = '';
    historyMap['description'] = '';
    historyMap['period'] = '';
    await documentReferenceStoneGetted.collection(STONES_HISTORIES).add(historyMap);
    return true;
  }

  // method check if stone already exist
  Future<bool> checkStoneAlreadyExist(String stoneTitle) async {
    Query collectionTitleWhere = dataBase.collection(STONES_STRING).where('title', isEqualTo: stoneTitle);
    QuerySnapshot querySnapshot = await collectionTitleWhere.getDocuments();
    List<DocumentSnapshot> snapshot = querySnapshot.documents;

    if(snapshot.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  // method transform Stone to Map
  Map<String, dynamic> transformStoneToMap(Stone stoneData){
    Map dataStone = Map<String, dynamic>();
    dataStone['title'] = stoneData.title;
    dataStone['overview'] = stoneData.overview;
    dataStone['ethymology'] = stoneData.ethymology;
    dataStone['pictures'] = stoneData.pictures;
    dataStone['countries'] = stoneData.countries;
    dataStone['description'] = stoneData.description;
    dataStone['hardness'] = stoneData.hardness;
    dataStone['group'] = stoneData.group;
    dataStone['cristallineSystem'] = stoneData.cristallineSystem;
    dataStone['chemicalComposition'] = stoneData.chemicalComposition;
    dataStone['defaultPicture'] = stoneData.defaultPicture;
    return dataStone;
  }

  // TODO method update one stone
}
