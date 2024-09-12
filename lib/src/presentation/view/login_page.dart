import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/login_model.dart';
import '../../infra/repository/auth_repository.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/events/auth_event.dart';
import '../bloc/states/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthRepository _repository = AuthRepository();
  late final AuthBloc _bloc;

  @override
  void initState() {
    _bloc = AuthBloc(_repository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: _blocListener,
        bloc: _bloc,
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text("Login"),
                    const Padding(padding: EdgeInsets.all(10)),
                    _buildTextField(
                      placeholder: "Username",
                      controller: usernameController,
                    ),
                    _buildTextField(
                      placeholder: "Password",
                      controller: passwordController,
                    ),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildTextField({
    required String placeholder,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoTextField(
        placeholder: placeholder,
        controller: controller,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: const BorderRadius.all(Radius.elliptical(10, 10)),
        ),
      ),
    );
  }

  void _blocListener(BuildContext context, AuthState state) {
    if (state is LoginSuccessState) {
      log(state.status.name, name: "success_message", time: DateTime.now());
    }
    if (state is LoginErrorState) {
      log(
        state.status.name,
        name: "error_message",
        error: state.status.name,
        time: DateTime.now(),
      );
    }
    if (state is LoadingAuthState) {}
  }

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      _authenticUser();
    }
  }

  void _authenticUser() {
    _bloc.add(
      LoginEvent(
        LoginModel(
          username: usernameController.text,
          password: passwordController.text,
        ),
      ),
    );
  }
}
