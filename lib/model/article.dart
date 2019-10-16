import 'package:app/model/country.dart';
import 'package:app/model/history.dart';
import 'package:app/model/picture.dart';

class Article{
  String title;
  String overview;
  String etymology;
  String attribute;
  List<History> histories;
  List<Picture> pictures;
  List<Country> countries;

  Article(this.title, this.overview, this.attribute, this.etymology){
    this.histories = new List<History>();
    this.countries = new List<Country>();
    this.pictures = new List<Picture>();
  }
}