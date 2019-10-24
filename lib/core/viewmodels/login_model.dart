import 'dart:async';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/base_model.dart';
import 'package:edelsten/locator.dart';
import 'package:flutter/widgets.dart';

class LoginModel extends BaseModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final TextEditingController textController = TextEditingController();
  final  TextEditingController passWordController = TextEditingController();
  String errorMessage;


  Future<bool> login() async {
    setState(ViewState.Busy);

    var identifier = textController.text;
    var password = passWordController.text;
    
    if ( identifier == '' || password == '')
    {
      errorMessage = 'No valid identification!';
      setState(ViewState.Idle);
      resetcontrollers();
      return false;
    }
    var success = false;
    
    try {
      success = await _authenticationService.login(identifier, password);
    } catch (error) {
        errorMessage = error.toString();
    }
    resetcontrollers();
    setState(ViewState.Idle);
    return success;
  }

  void resetcontrollers(){
    textController.clear();
    passWordController.clear();
  }
}
