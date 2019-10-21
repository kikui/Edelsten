import 'package:edelsten/core/models/book.dart';

class User {
  int id;
  String pseudo;
  bool administrator;
  List<String> favorites;
  List<Book> books;
  
  User.initial()
      : id = 0,
        pseudo = '',
        administrator = false;
}