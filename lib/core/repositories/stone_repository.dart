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
    print('END GET ALL');
    return stoneList;
  }

  // method get one stone
  Future<Stone> getOneStone(String uuidStone) async {
    CollectionReference collectionStoneReference = dataBase.collection('stones');
    DocumentReference documentStoneReference = collectionStoneReference.document(uuidStone);
    DocumentSnapshot snapshotStone = await documentStoneReference.get();
    Stone stoneData = Stone.fromSnapshot(snapshotStone);
    print('END GET ON');
    return stoneData;
  }

  // method update one stone
}