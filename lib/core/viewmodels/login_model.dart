import 'dart:async';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/base_model.dart';
import 'package:edelsten/locator.dart';
import 'package:flutter/widgets.dart';

class LoginModel extends BaseModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final TextEditingController emailController = TextEditingController();
  final  TextEditingController passwordController = TextEditingController();
  String errorMessage;


  Future<bool> login() async {
    setState(ViewState.Busy);

    var email = emailController.text;
    var password = passwordController.text;
    
    if ( email == '' || password == '')
    {
      errorMessage = 'Identification invalide!';
      setState(ViewState.Idle);
      resetcontrollers();
      return false;
    }
    var success = false;
    
    try {
      success = await _authenticationService.login(email, password);
    } 
    catch (error) {
      errorMessage = convertErrorMessage(error.code);
    }
    resetcontrollers();
    setState(ViewState.Idle);
    return success;
  }

  String convertErrorMessage(String code){
    var dict = {
      "ERROR_INVALID_EMAIL" : "L'adresse mail n'est pas valide!",
      "ERROR_WRONG_PASSWORD" : "Le mot de passe n'est pas valide!"
      };
    return dict[code];
  }

  void resetcontrollers(){
    emailController.clear();
    passwordController.clear();
  }
}
