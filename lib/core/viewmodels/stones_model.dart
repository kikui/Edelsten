import 'dart:async';
import 'package:edelsten/core/helper/commonHelper.dart';
import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/models/stone.dart';
import 'package:edelsten/core/repositories/stone_repository.dart';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/viewmodels/viewmodel.dart';
import 'package:edelsten/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../view_state.dart';

class StonesModel extends BaseModel {
  StoneRepository _stoneRepo = locator<StoneRepository>();
  AuthenticationService _auth = locator<AuthenticationService>();
  CommonHelper _commonHelper = new CommonHelper();

  List<bool> _stateFavory = new List();
  List<bool> get stateFavory => _stateFavory;

  List<Stone> stones;
  TextEditingController filter = TextEditingController(); 
  Icon searchIcon = Icon(Icons.search);
  Widget searchBar = Text("chercher une pierre");
  String searchText = "";
  List<Stone> filteredStones; 

  void setStateFavory() {
    stones.forEach((e) => {
      _commonHelper.stringToInt(e.id),
      //_stateFavory[int.parse(e.id)] = isFavory(e.id)
    });
    notifyListeners();
  }

  void updateStateFavory(String uuidStone) {
    _stateFavory[int.parse(uuidStone)] = !_stateFavory[int.parse(uuidStone)];
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

  void updateFavory(String uuidStone) async {
    if(_stateFavory[int.parse(uuidStone)]) {
      //await _userRepo.deleteFavory(_auth.user, stone.id);
    } else {
      //await _userRepo.addFavory(_auth.user, stone.id);
    }
    updateStateFavory(uuidStone);
  }
}