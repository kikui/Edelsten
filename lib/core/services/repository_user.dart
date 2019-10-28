import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edelsten/core/models/user.dart';

class RepositoryUser {
  // method get user(uuid)
  Future<User> getUserData(String uuid) async {
    Firestore dataBase = Firestore.instance;    
    CollectionReference userCollectionReference = dataBase.collection('users');
    DocumentReference userDocumentReference = userCollectionReference.document(uuid);
    DocumentSnapshot userDocumentSnapshot = await userDocumentReference.get();
    print(userDocumentSnapshot);
    return User.fromSnapshot(userDocumentSnapshot);
    // try{
    //   DocumentSnapshot userDocumentSnapshot = await userDocumentReference.get();
    //   print(userDocumentSnapshot);
    //   return User.fromSnapshot(userDocumentSnapshot);
    // } catch(e){
    //   print(e);
    // }
    // return null;
  }
  // method get all articles
  // method get one article(uuid)
  // method get comment(uuid article)
}
