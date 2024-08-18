import 'package:provider_arc/core/services/authentication_service.dart';
import 'package:provider_arc/core/viewmodels/views/base_model.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService;
  LoginViewModel({required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  Future<bool> login(String userIdText) async {
    setBusy(true);
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId!);
    setBusy(false);
    return success;
  }
}
