import 'package:edelsten/core/article_repository/article_repository.dart';
import 'package:edelsten/core/viewmodels/base_model.dart';
import 'package:edelsten/locator.dart';
import 'package:edelsten/core/models/stone.dart';

class StoneModel extends BaseModel {

  Api _api = locator<Api>();
  Stone stone;
  
}