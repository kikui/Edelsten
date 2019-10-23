import 'package:edelsten/core/article_repository/article_repository.dart';
import 'package:edelsten/core/models/stone.dart';
import 'package:edelsten/core/viewmodels/viewmodel.dart';
import 'package:edelsten/locator.dart';

import '../view_state.dart';

class StonesModel extends BaseModel {
  Api _api = locator<Api>();

  List<Stone> stones;
  
  Future getstones() async {
    setState(ViewState.Busy);
    stones = await _api.getAllStones();
    setState(ViewState.Idle);
  }
}