import 'dart:async';
import 'package:edelsten/core/helper/favoryHelper.dart';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/models/stone.dart';
import 'package:edelsten/core/repositories/stone_repository.dart';
import 'package:edelsten/core/viewmodels/viewmodel.dart';
import 'package:edelsten/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../view_state.dart';

class StonesModel extends BaseModel {
  StoneRepository _stoneRepo = locator<StoneRepository>();
  FavoryHelper _favoryHelper = FavoryHelper();

  Map<String, bool> _stateFavory = new Map();
  Map<String, bool> get stateFavory => _stateFavory;

  List<Stone> stones;
  TextEditingController filter = TextEditingController(); 
  Icon searchIcon = Icon(Icons.search);
  Widget searchBar = Text("chercher une pierre");
  String searchText = "";
  List<Stone> filteredStones; 

  void setStateFavory() {
    _stateFavory.clear();
    stones.forEach((e) => {
      _stateFavory[e.id] = _favoryHelper.isFavory(e.id)
    });
    notifyListeners();
  }

  void updateStateFavory(String uuidStone) {
    _stateFavory[uuidStone] = !_stateFavory[uuidStone];
    notifyListeners();
  }
  
  StonesModel(){
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

  Future getstones() async {
    setState(ViewState.Busy);
    stones = await _stoneRepo.getAllStones();
    setStateFavory();
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

  void updateFavory(String uuidStone) async {
    _favoryHelper.updateFavory(uuidStone, _stateFavory[uuidStone]);
    updateStateFavory(uuidStone);
  }
}