import '../../../domain/models/login_model.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginModel model;

  LoginEvent(this.model);
}
