import '../../../domain/enums/login_status_enum.dart';

abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class LoginSuccessState extends AuthState {
  final LoginStatus status;

  LoginSuccessState(this.status);
}

class LoginErrorState extends AuthState {
  final LoginStatus status;

  LoginErrorState(this.status);
}
