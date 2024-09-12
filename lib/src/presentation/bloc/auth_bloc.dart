import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/enums/login_status_enum.dart';
import '../../infra/repository/auth_repository.dart';
import 'events/auth_event.dart';
import 'states/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(InitialAuthState()) {
    on<LoginEvent>(_login);
  }

  Future<void> _login(LoginEvent event, Emitter emit) async {
    emit(LoadingAuthState());
    final LoginStatus status = authRepository.login(event.model);

    if (status == LoginStatus.SUCCESS) {
      emit(LoginSuccessState(status));
    } else {
      emit(LoginErrorState(status));
    }
  }
}
