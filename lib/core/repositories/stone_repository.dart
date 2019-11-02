import 'dart:async';
import 'dart:core' ;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edelsten/core/models/model.dart';

class StoneRepository {
  
  final Firestore dataBase = Firestore.instance;  

  // method get all stone
  Future<List<Stone>> getAllStones() async {
    List<Stone> stoneList = new List();  
    CollectionReference collectionStoneReference = dataBase.collection('stones');
    List<DocumentSnapshot> stonesSnapshot = (await collectionStoneReference.getDocuments()).documents;
    stonesSnapshot.forEach((e) => {
      stoneList.add(Stone.fromSnapshot(e))
    });
    return stoneList;
  }

  // method get one stone
  Future<Stone> getOneStone(String uuidStone) async {
    CollectionReference collectionStoneReference = dataBase.collection('stones');
    DocumentReference documentStoneReference = collectionStoneReference.document(uuidStone);
    DocumentSnapshot snapshotStone = await documentStoneReference.get();
    Stone stoneData = Stone.fromSnapshot(snapshotStone);

    Query collectionHistoriesReference = documentStoneReference.collection('histories');
    QuerySnapshot querySnapshot = await collectionHistoriesReference.getDocuments();
    List<DocumentSnapshot> historiesSnapshot = querySnapshot.documents;

    historiesSnapshot.forEach((e) => {
      stoneData.histories.add(History.fromSnapshot(e))
    });
    return stoneData;
  }

  Future<DocumentReference> getDocumentStoneByTitle(String stoneTitle) async {
    Query collectionTitleWhere = dataBase.collection('stones').where('title', isEqualTo: stoneTitle);
    QuerySnapshot querySnapshot = await collectionTitleWhere.getDocuments();
    List<DocumentSnapshot> snapshot = querySnapshot.documents;
    DocumentReference stoneReference = dataBase.collection('stones').document(snapshot.first.documentID);
    return stoneReference;
  }

  Future<bool> createStoneData(Stone stoneData) async {
    CollectionReference stoneCollectionReference = dataBase.collection('stones');
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
    await documentReferenceStoneGetted.collection('histories').add(historyMap);
    return true;
  }

  // method check if stone already exist
  Future<bool> checkStoneAlreadyExist(String stoneTitle) async {
    Query collectionTitleWhere = dataBase.collection('stones').where('title', isEqualTo: stoneTitle);
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
  // method update one stone
}