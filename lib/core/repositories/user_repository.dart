import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {

  final Firestore dataBase = Firestore.instance;  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // method login
  Future<FirebaseUser> loginUser({String email, String password}) async {
    FirebaseUser result  = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
    return result;
  }

  Future<FirebaseUser> currentUser() async {
    return await _auth.currentUser();
  }

  Future loginOut({String email, String password}) async {
    await _auth.signOut();
  }
  // method register
  Future<FirebaseUser> registerUser({String email, String password}) async {
    FirebaseUser result  = (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
    return result;
  }

  // method get userDocument(user uuid)
  DocumentReference getUserDocument(String uuidUser) {
    CollectionReference userCollectionReference = dataBase.collection('users');
    DocumentReference userDocumentReference = userCollectionReference.document(uuidUser);
    return userDocumentReference;
  }

  // method create userData(uuid)
  void createUserData(User user) async {
    CollectionReference userCollectionReference = dataBase.collection('users');
    Map dataUser = Map<String, dynamic>();
    dataUser['pseudo'] = user.pseudo;
    dataUser['administrator'] = false;
    dataUser['favorites'] = List();
    await userCollectionReference.document(user.id).setData(dataUser);

    DocumentReference documentUser = getUserDocument(user.id);
    Map dataBook = Map<String, dynamic>();
    dataBook['title'] = 'Première page du grimoire';
    dataBook['body'] = '';
    await documentUser.collection('books').add(dataBook);
  }

  Stream<User> getUserData(String uuidUser) {  
    return getUserDocument(uuidUser).snapshots().map<User>((DocumentSnapshot snapshot) {
      return User.fromSnapshot(snapshot);
    });
  }

  // method get user favorites(user uuid)
  Future<List<Stone>> getUserFavorites(List<dynamic> listReference) async {
    List<Stone> listFavorites = List();
    DocumentReference stoneReference;
    DocumentSnapshot stoneSnapshot;
    Stone stone;

    listReference.forEach((e) async => {
      stoneReference = e,
      stoneSnapshot = await stoneReference.get(),
      stone = Stone.fromSnapshot(stoneSnapshot),
      listFavorites.add(stone)
    });

    return listFavorites;
  }

  // method add favorite(stone uuid)
  void addFavory(User user, String uuidStone) {
    CollectionReference stoneCollectionReference = dataBase.collection('stones');
    DocumentReference stoneDocumentReference = stoneCollectionReference.document(uuidStone);
    DocumentReference userDocumentReference = getUserDocument(user.id);

    user.favorites.add(stoneDocumentReference);
    Map data = Map<String, List<dynamic>>();
    data['favorites'] = user.favorites;
    userDocumentReference.updateData(data);
  }

  //method delete favorite(stone uuid)
  void deleteFavory(User user, String uuidStone) async {
    CollectionReference stoneCollectionReference = dataBase.collection('stones');
    DocumentReference stoneDocumentReference = stoneCollectionReference.document(uuidStone);
    DocumentReference userDocumentReference = getUserDocument(user.id);

    user.favorites.remove(stoneDocumentReference);
    Map data = Map<String, List<dynamic>>();
    data['favorites'] = user.favorites;
    userDocumentReference.updateData(data);
  }

  // method get stream books(user uuid)
  // method add book
  // method delete book(book uuid)
  // method update book(book uuid)
}
