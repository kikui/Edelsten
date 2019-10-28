import 'package:edelsten/core/view_state.dart';
import 'package:flutter/cupertino.dart';

class BaseModel extends ChangeNotifier {
  
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void setStateWithFunction(Function function){
    setState(ViewState.Busy);
    function();
    setState(ViewState.Idle);

  }
}