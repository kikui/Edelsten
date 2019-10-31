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
  
  // method get userData(user uuid)
  Future<User> getUserData(String uuid) async {  
    CollectionReference userCollectionReference = dataBase.collection('users');
    DocumentReference userDocumentReference = userCollectionReference.document(uuid);
    DocumentSnapshot userDocumentSnapshot = await userDocumentReference.get();
    User userData = User.fromSnapshot(userDocumentSnapshot);
    return userData;
  }

  // method get user favorites(user uuid)
  Future<List<Article>> getUserFavorites(List<dynamic> listReference) async {
    List<Article> listFavorites = List();
    DocumentReference articleReference;
    DocumentSnapshot articleSnapshot;
    Article article;

    listReference.forEach((e) async => {
      articleReference = e,
      articleSnapshot = await articleReference.get(),
      article = Article.fromSnapshot(articleSnapshot),
      listFavorites.add(article)
    });

    return listFavorites;
  }

  // method add favorite(article documentReference)
  void addFavory(String uuid) async {
    // get document ref
    // add to user 
    // refresh user
  }

  //method delete favorite(article uuid)
  void deleteFavory(String uuid) async {
    
  }

  // method get books user(user uuid)
  // method add book
  // method delete book(book uuid)
  // method update book(book uuid)
}
