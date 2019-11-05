import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_mock/firestore_mock.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  MockFirestore mockFirestore = new MockFirestore(data: {
     "articles": {
         "document_id_1": {
           "title": "Flutter is Awesome",
           "author": "uid",
           "views": 123,
         },
         "document_id_2": {
           "title": "Kotlin is better than Dart",
           "author": "uid_2",
           "views": 999,
         }
   }
});

  group('test firestore', () {
    test('get document', () async {
      CollectionReference collectionReference = mockFirestore.collection('articles');
      DocumentReference documentReference = collectionReference.document('document_id_1');
      DocumentSnapshot documentSnapshot = await documentReference.get();
      var resutl = documentSnapshot.data["title"];
      expect(resutl, 'Flutter is Awesome');
    });
    test('get collection snapshot', () async {
      bool check = false;
      CollectionReference collectionReference = mockFirestore.collection('articles');
      QuerySnapshot querySnapshot = await collectionReference.getDocuments();
      List<DocumentSnapshot> listDocumentSnapshot = querySnapshot.documents;
      listDocumentSnapshot.forEach((e) => {
        if(e.data['title'] != null){
          check = true
        } else {
          check = false
        }
      });
      expect(check, true);
    });
    test('add document', () async {
      Map<String, dynamic> data = new Map<String, dynamic>();
      data['title'] = 'test OK';
      CollectionReference collectionReference = mockFirestore.collection('articles');
      QuerySnapshot querySnapshot = await collectionReference.getDocuments();
      expect(querySnapshot.documents.length, 2);
      await mockFirestore.collection('articles').add(data);
      querySnapshot = await collectionReference.getDocuments();
      expect(querySnapshot.documents.length, 3);
    });
  });
}