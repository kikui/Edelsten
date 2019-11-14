import 'dart:async';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/base_model.dart';
import 'package:edelsten/locator.dart';
import 'package:flutter/widgets.dart';

class RegisterModel extends BaseModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCheckerController = TextEditingController();

  String errorMessage = "Une erreur est survenue, merci de reessayer.";

  Future<bool> register() async {
    setState(ViewState.Busy);

    var email = emailController.text;
    var username = usernameController.text;
    var password = passwordController.text;
    var passwordChecker = passwordCheckerController.text;
    
    if ( email.isEmpty ||  username.isEmpty || password.isEmpty || passwordChecker.isEmpty)
    {
      errorMessage = 'Merci de ne pas laisser de champs vides.';
      setState(ViewState.Idle);
      resetcontrollers();
      return false;
    }
    else if (password != passwordChecker) {
      errorMessage = 'Les mots de passe ne correspondent pas.';
      setState(ViewState.Idle);
      resetcontrollers();
      return false;
    }
    else if (password.length < 6) {
      errorMessage = 'Le mot de passe doit faire plus de 6 caractères.';
      setState(ViewState.Idle);
      resetcontrollers();
      return false;
    }
    var success = false;
    
    try {
      success = await _authenticationService.register(email, password, username);
    } 
    catch (error) {
      errorMessage = "FirebaseException : Erreur de connexion avec la base de données!";
    }
    resetcontrollers();
    setState(ViewState.Idle);
    return success;
  }

  void resetcontrollers(){
    emailController.clear();
    usernameController.clear();
    passwordController.clear();
  }
}