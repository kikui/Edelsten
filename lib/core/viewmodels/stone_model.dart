import 'package:edelsten/core/models/stone.dart';
import 'package:edelsten/core/repositories/stone_repository.dart';
import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/base_model.dart';
import 'package:edelsten/locator.dart';

class StoneModel extends BaseModel {
  StoneRepository _stoneRepo = locator<StoneRepository>();
  Stone stone;

  Future getStone(String uuidStone) async {
    setState(ViewState.Busy);
    stone = await _stoneRepo.getOneStone(uuidStone);
    setState(ViewState.Idle);
  }
}