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

  // method get userDocument(user uuid)
  DocumentReference getUserDocument(String uuidUser) {
    CollectionReference userCollectionReference = dataBase.collection('users');
    DocumentReference userDocumentReference = userCollectionReference.document(uuidUser);
    return userDocumentReference;
  }

  // method create userData(uuid)
  void createUser(User user) async {
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

  // method get userData(user uuid)
  Future<User> getUserData(String uuidUser) async {  
    DocumentReference userDocumentReference = getUserDocument(uuidUser);
    DocumentSnapshot userDocumentSnapshot = await userDocumentReference.get();
    User userData = User.fromSnapshot(userDocumentSnapshot);

    // get userBooks
    List<DocumentSnapshot> booksSnapshot = (await userDocumentReference.collection('books').getDocuments()).documents;
    booksSnapshot.forEach((e) => {
      userData.books.add(Book.fromSnapshot(e))
    });

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

  // method add favorite(article uuid)
  void addFavory(User user, String uuidStone) {
    // get document ref
    CollectionReference stoneCollectionReference = dataBase.collection('stones');
    DocumentReference stoneDocumentReference = stoneCollectionReference.document(uuidStone);
    // add to user 
    DocumentReference userDocumentReference = getUserDocument(user.id);

    user.favorites.add(stoneDocumentReference);
    Map data = Map<String, List<dynamic>>();
    data['favorites'] = user.favorites;
    userDocumentReference.updateData(data);
  }

  //method delete favorite(article uuid)
  void deleteFavory(User user, String uuidStone) async {
    CollectionReference stoneCollectionReference = dataBase.collection('stones');
    DocumentReference stoneDocumentReference = stoneCollectionReference.document(uuidStone);
    DocumentReference userDocumentReference = getUserDocument(user.id);

    user.favorites.remove(stoneDocumentReference);
    Map data = Map<String, List<dynamic>>();
    data['favorites'] = user.favorites;
    userDocumentReference.updateData(data);
  }

  // method add book
  // method delete book(book uuid)
  // method update book(book uuid)
}
