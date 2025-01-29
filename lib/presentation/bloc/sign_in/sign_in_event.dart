import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchLogin extends SignInEvent {
  final String email;
  final String password;
  final bool rememberMe;

  FetchLogin(
      {required this.email, required this.password, required this.rememberMe});

  @override
  List<Object?> get props => [email, password, rememberMe];
}

class ToggleRememberMeEvent extends SignInEvent {
  final bool value;

  ToggleRememberMeEvent({required this.value});

  @override
  List<Object?> get props => [value];
}
