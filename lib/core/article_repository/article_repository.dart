import 'package:edelsten/core/models/model.dart';

class ArticleRepository {
  int id;
  String title;
  String overview;
  String picture;

  ArticleRepository({this.id, this.title, this.overview, this.picture});

  factory ArticleRepository.fromMap(Map<String, dynamic> map) {
    return ArticleRepository(
      id: map['id'],
      title: map['title'],
      overview: map['overview'],
      picture: map['picture'],
    );
  }
}

class Api {
  Future<List> getAllStones() async {
    await Future.delayed(Duration(seconds: 1));
    return articles;
  }

  Future<User> getUserProfile(String identifier, String password) async {
    if (identifier == "test" && password == "123")
      return User.initial();
    return null;
  }
}

var articles = [
  ArticleRepository(
      id: 0,
      title: 'Amethyst',
      overview: 'Protéger contre l\'ivresse',
      picture: 'amethyst.jpg'),
  ArticleRepository(
      id: 1,
      title: 'Obsidienne',
      overview: 'Quête de soi et de vérité',
      picture: 'obsidian.jpg'),
  ArticleRepository(
      id: 2,
      title: 'Emeraude',
      overview: 'Favorise l\'amitié',
      picture: 'emerald.jpg'),
  ArticleRepository(
      id: 3,
      title: 'Ruby',
      overview: 'Favorise l\'amitié',
      picture: 'ruby.jpg'),
  ArticleRepository(
      id: 4,
      title: 'Quartz',
      overview: 'Favorise l\'amitié',
      picture: 'quartz.jpg'),
];
