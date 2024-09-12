import '../../domain/enums/login_status_enum.dart';
import '../../domain/models/login_model.dart';

class AuthRepository {
  LoginStatus login(LoginModel model) {
    if (model.username == "teste" && model.password == "teste") {
      return LoginStatus.SUCCESS;
    } else {
      return LoginStatus.ERROR;
    }
  }
}
