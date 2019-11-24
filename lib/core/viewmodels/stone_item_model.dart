import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/repositories/user_repository.dart';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/viewmodels/viewmodel.dart';
import 'package:edelsten/locator.dart';

class StoneItemModel extends BaseModel {
  AuthenticationService _auth = locator<AuthenticationService>();
  UserRepository _userRepo = locator<UserRepository>();
  Stone stone;
  
  StonesModel(Stone stone){
    this.stone = stone;
  }

  Future<bool> updateFavory(String uuidStone, bool deleteFavory) async {
    if(deleteFavory) {
      //await _userRepo.deleteFavory(_auth.user, stone.id);
      return false;
    } else {
      //await _userRepo.addFavory(_auth.user, stone.id);
      return true;
    }
  }

}