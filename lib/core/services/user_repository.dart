import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {

  final Firestore dataBase = Firestore.instance;  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // method auth
  Future<FirebaseUser> loginUser({String email, String password}) async {
    var result  = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
    return result;
  }

  // method create userData(uuid)
  
  // method get userData(uuid)
  Future<User> getUserData(String uuid) async {  
    CollectionReference userCollectionReference = dataBase.collection('users');
    DocumentReference userDocumentReference = userCollectionReference.document(uuid);
    DocumentSnapshot userDocumentSnapshot = await userDocumentReference.get();
    User userData = User.fromSnapshot(userDocumentSnapshot);
    return userData;
  }

  // method get books user(uuid)
}
