import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/core/view_state.dart';
import 'package:edelsten/core/viewmodels/base_model.dart';
import 'package:edelsten/locator.dart';

class ParametersModel extends BaseModel {
  AuthenticationService _authService = locator<AuthenticationService>();
  final String errorOnLogout = "Deconnexion échouée, reéssayé plus tard!";

  Future<bool> logout() async {
    setState(ViewState.Busy);
    var result  = await _authService.logout();
    setState(ViewState.Idle);
    return result;
  }
}