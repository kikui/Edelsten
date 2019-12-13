

import 'package:edelsten/core/repositories/user_repository.dart';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/locator.dart';

class FavoryHelper {
  AuthenticationService _auth = locator<AuthenticationService>();
  UserRepository _userRepo = locator<UserRepository>();

  // check if the stone isFavory
  bool isFavory(String uuidStone) {
    if(_auth.user != null){
      List<dynamic> listDocumentReferenceFavory = _auth.user.favorites;
      for (var i = 0; i < listDocumentReferenceFavory.length; i++) {
        String uuidFavory = listDocumentReferenceFavory[i].documentID;
        if(uuidStone == uuidFavory) {
          return true;
        }
      }
    }
    return false;
  }

  // update user favory statut
  void updateFavory(String uuidStone, bool isFavory) {
    if(isFavory) {
      _userRepo.deleteFavory(_auth.user, uuidStone);
    } else {
      _userRepo.addFavory(_auth.user, uuidStone);
    }
  }
}