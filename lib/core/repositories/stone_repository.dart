import 'dart:async';
import 'dart:async' as prefix0;
import 'dart:core' ;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/models/stone.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StoneRepository {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String stonesString = "stones";  
  
  Future<FirebaseUser> loginUser({String email, String password}) async {
    var result  = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
    return result;
  }
  
  Future<List<Stone>> getAllStones() async {
    var stonesList = new List<Stone>();  
    try {
      var stoneCollection = Firestore.instance.collection(stonesString);
      var documents = (await stoneCollection.getDocuments()).documents;
      for (var document in documents) {
        var stone = Stone(
          title: document.data["title"],
          id: document.data["id"],
        );
        stonesList.add(stone);
      }
    } catch (e) {
      print(e);
      return stonesList;
    }
  }
  
  // Future<List<Stone>> getAllStones2() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   return stones;
  // }

  Future<User> getUserData(String uuid) async {
  }
}

var stones = [
  Stone(
    id: "0",
    title: 'Amethyst',
    overview: 'Protéger contre l\'ivresse',
    picture: 'amethyst.jpg',
    countries: ['Uruguay', 'Brésil', 'Inde', 'Madagascar'],
    ethymology:
        'Nom inspiré du fruit du cornouiller et de la couleur de la chair',
    group: 'Quartz micro-cristallins, famille des agates',
    chemicalComposition: 'Dioxyde de silicium, Sio2',
    cristallineSystem: 'Rhomboédrique',
    hardness: '6-7',
    description:
        'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.',
    histories: [
      History(
          title: 'Première trace',
          period: '500 AV JC',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
      History(
          title: 'Les bijoux excessifs des reines de France',
          period: '1600',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
      History(
          title: 'Naissance d\'une pierre hors du commun!',
          period: '1998',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
    ],
    pictures: [
      'ame1.jpg',
      'ame2.jpg',
      'ame3.jpg',
      'ame4.jpg',
      'ame5.jpg',
      'ame6.jpg',
      'ame7.jpg'
    ],
  ),
  Stone(
    id: "1",
    title: 'Obsidienne',
    overview: 'Quête de soi et de vérité',
    picture: 'obsidian.jpg',
    countries: ['Uruguay', 'Brésil', 'Inde', 'Madagascar'],
    ethymology:
        'Nom inspiré du fruit du cornouiller et de la couleur de la chair',
    group: 'Quartz micro-cristallins, famille des agates',
    chemicalComposition: 'Dioxyde de silicium, Sio2',
    cristallineSystem: 'Rhomboédrique',
    hardness: '6-7',
    description:
        'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.',
    histories: [
      History(
          title: 'Première trace',
          period: '500 AV JC',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
      History(
          title: 'Les bijoux excessifs des reines de France',
          period: '1600',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
      History(
          title: 'Naissance d\'une pierre hors du commun!',
          period: '1998',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
    ],
    pictures: [
      'ame1.jpg',
      'ame2.jpg',
      'ame3.jpg',
      'ame4.jpg',
      'ame5.jpg',
      'ame6.jpg',
      'ame7.jpg'
    ],
  ),
  Stone(
    id: "2",
    title: 'Emeraude',
    overview: 'Favorise l\'amitié',
    picture: 'emerald.jpg',
    countries: ['Uruguay', 'Brésil', 'Inde', 'Madagascar'],
    ethymology:
        'Nom inspiré du fruit du cornouiller et de la couleur de la chair',
    group: 'Quartz micro-cristallins, famille des agates',
    chemicalComposition: 'Dioxyde de silicium, Sio2',
    cristallineSystem: 'Rhomboédrique',
    hardness: '6-7',
    description:
        'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.',
    histories: [
      History(
          title: 'Première trace',
          period: '500 AV JC',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
      History(
          title: 'Les bijoux excessifs des reines de France',
          period: '1600',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
      History(
          title: 'Naissance d\'une pierre hors du commun!',
          period: '1998',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
    ],
    pictures: [
      'ame1.jpg',
      'ame2.jpg',
      'ame3.jpg',
      'ame4.jpg',
      'ame5.jpg',
      'ame6.jpg',
      'ame7.jpg'
    ],
  ),
  Stone(
    id: "3",
    title: 'Ruby',
    overview: 'Favorise l\'amitié',
    picture: 'ruby.jpg',
    countries: ['Uruguay', 'Brésil', 'Inde', 'Madagascar'],
    ethymology:
        'Nom inspiré du fruit du cornouiller et de la couleur de la chair',
    group: 'Quartz micro-cristallins, famille des agates',
    chemicalComposition: 'Dioxyde de silicium, Sio2',
    cristallineSystem: 'Rhomboédrique',
    hardness: '6-7',
    description:
        'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.',
      histories: [
      History(
          title: 'Première trace',
          period: '500 AV JC',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
      History(
          title: 'Les bijoux excessifs des reines de France',
          period: '1600',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
      History(
          title: 'Naissance d\'une pierre hors du commun!',
          period: '1998',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
    ],
    pictures: [
      'ame1.jpg',
      'ame2.jpg',
      'ame3.jpg',
      'ame4.jpg',
      'ame5.jpg',
      'ame6.jpg',
      'ame7.jpg'
    ],
  ),
  Stone(
    id: "4",
    title: 'Quartz',
    overview: 'Favorise l\'amitié',
    picture: 'quartz.jpg',
    countries: ['Uruguay', 'Brésil', 'Inde', 'Madagascar'],
    ethymology:
        'Nom inspiré du fruit du cornouiller et de la couleur de la chair',
    group: 'Quartz micro-cristallins, famille des agates',
    chemicalComposition: 'Dioxyde de silicium, Sio2',
    cristallineSystem: 'Rhomboédrique',
    hardness: '6-7',
    description:
        'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.',
    histories: [
      History(
          title: 'Première trace',
          period: '500 AV JC',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
      History(
          title: 'Les bijoux excessifs des reines de France',
          period: '1600',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
      History(
          title: 'Naissance d\'une pierre hors du commun!',
          period: '1998',
          description:
              'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.Le Lorem Ipsum est le faux texte standard de l’imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser unlivre spécimen de polices de texte. Il n’a pas fait que survivrecinq siècles, mais s’est aussi adapté à la bureautique informatique, sans que son contenu n’en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.'),
    ],
    pictures: [
      'ame1.jpg',
      'ame2.jpg',
      'ame3.jpg',
      'ame4.jpg',
      'ame5.jpg',
      'ame6.jpg',
      'ame7.jpg'
    ],
  ),
];
