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

  // method get user favorites(user uuid)
  Future<List<Article>> getUserFavorites(String uuid) async {

    return null;
  }

  // method add favorite(article uuid)
  void addFavory(String uuid) async {

  }

  //method delete favorite(article uuid)
  void deleteFavory(String uuid) async {
    
  }

  // method get books user(user uuid)
  Future<List<Book>> getUserBooks(String uuid) async {
    
    return null;
  }

  // method add book
  // method delete book(book uuid)
  // method update book(book uuid)
}
