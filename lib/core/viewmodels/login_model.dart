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

    var identifier = textController.toString();
    var password = passWordController.toString();
    
    if ( identifier == '' || password == '')
    {
      errorMessage = 'No valid identification!';
      setState(ViewState.Idle);
      return false;
    }
    var success = await _authenticationService.login(identifier, password);

    setState(ViewState.Idle);
    return success;
  }
}
