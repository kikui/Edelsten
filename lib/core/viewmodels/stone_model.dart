import 'package:edelsten/core/helper/favoryHelper.dart';
import 'package:edelsten/core/models/stone.dart';
import 'package:edelsten/core/repositories/stone_repository.dart';
import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/base_model.dart';
import 'package:edelsten/locator.dart';

class StoneModel extends BaseModel {
  StoneRepository _stoneRepo = locator<StoneRepository>();
  FavoryHelper _favoryHelper = FavoryHelper();
  Stone stone;

  bool _stateFavory;
  bool get stateFavory => _stateFavory;

  Future getStone(String uuidStone) async {
    setState(ViewState.Busy);
    stone = await _stoneRepo.getOneStone(uuidStone);
    _stateFavory = _favoryHelper.isFavory(uuidStone);
    setState(ViewState.Idle);
  }

  void updateFavory(String uuidStone) async {
    _favoryHelper.updateFavory(uuidStone, _stateFavory);
    updateStateFavory(uuidStone);
  }

  void updateStateFavory(String uuidStone) {
    _stateFavory = !_stateFavory;
    notifyListeners();
  }
}