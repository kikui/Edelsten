import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/models/stone.dart';

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
    return stones;
  }

  Future<User> getUserProfile(String identifier, String password) async {
    await Future.delayed(Duration(seconds: 1));
    if (identifier == "test" && password == "123")
      return User.initial();
    return null;
  }
}

var stones = [
  Stone(
      id: 0,
      title: 'Amethyst',
      overview: 'Protéger contre l\'ivresse',
      picture: 'amethyst.jpg'),
  Stone(
      id: 1,
      title: 'Obsidienne',
      overview: 'Quête de soi et de vérité',
      picture: 'obsidian.jpg'),
  Stone(
      id: 2,
      title: 'Emeraude',
      overview: 'Favorise l\'amitié',
      picture: 'emerald.jpg'),
  Stone(
      id: 3,
      title: 'Ruby',
      overview: 'Favorise l\'amitié',
      picture: 'ruby.jpg'),
  Stone(
      id: 4,
      title: 'Quartz',
      overview: 'Favorise l\'amitié',
      picture: 'quartz.jpg'),
];

// Widget build(BuildContext context) {
//     return BaseView<StonesModel>(
//       onModelReady:  (model){
//         model.getstones();
//       },
//     );
//   }