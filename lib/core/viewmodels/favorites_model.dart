import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/repositories/user_repository.dart';
import 'package:edelsten/core/viewmodels/viewmodel.dart';
import 'package:edelsten/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../view_state.dart';

class FavoritesModel extends BaseModel {
  UserRepository _userRepo = locator<UserRepository>();
  AuthenticationService _auth = locator<AuthenticationService>();
  User user;
  List<Stone> favorites;

  FavoritesModel(){
    _auth.userController.stream.listen((User userGet) {
      user = userGet;
    });
  }

  Future getFavoritesStones() async {
    setState(ViewState.Busy);
    favorites = await _userRepo.getUserFavorites(user.favorites);
    setState(ViewState.Idle);
  }

  List<Stone> stoneToShow(){
    if (searchText.isNotEmpty){
      var tempList = List<Stone>();
      for (var i = 0; i < filteredStones.length; i++) {
        if (filteredStones[i].title.toLowerCase().contains(searchText.toLowerCase()))
          tempList.add(filteredStones[i]);
      }
      filteredStones = tempList;
    }
    return filteredStones;
  }
}