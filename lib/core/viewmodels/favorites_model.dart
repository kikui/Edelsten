import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/repositories/user_repository.dart';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/models/stone.dart';
import 'package:edelsten/core/viewmodels/viewmodel.dart';
import 'package:edelsten/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../view_state.dart';

class FavoritesModel extends BaseModel {
  UserRepository _userRepo = locator<UserRepository>();
  AuthenticationService _auth = locator<AuthenticationService>();

  List<Stone> stones;
  TextEditingController filter = TextEditingController(); 
  Icon searchIcon = Icon(Icons.search);
  Widget searchBar = Text("chercher une pierre");
  String searchText = "";
  List<Stone> filteredStones;
  
  FavoritesModel(){
    filter.addListener((){
      if(filter.text.isEmpty){
        setStateWithFunction((){
          searchText = "";
          filteredStones = stones;
        });
      }
      else{
        setStateWithFunction((){
          searchText = filter.text;
        });
      }
    });
  }

  void getFavoritesStones() async {
    setState(ViewState.Busy);
    stones = await _userRepo.getUserFavorites(_auth.user.favorites);
    filteredStones = stones;
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

  void searchIconPressed(){
    setState(ViewState.Busy);
    if (searchIcon.icon == Icons.search){
      searchIcon = Icon(Icons.close);
      searchBar = TextField(
        controller: filter,
        decoration: new InputDecoration(
          hintText: 'Nom de la pierre...'
        )
      );
    }
    else {
      searchIcon = Icon(Icons.search);
      searchBar = Text("Rechercher une pierre");
      filter.clear();
    }
    setState(ViewState.Idle);
  }
}