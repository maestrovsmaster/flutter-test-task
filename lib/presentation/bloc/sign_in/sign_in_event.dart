abstract class SignInEvent {}

class FetchLogin extends SignInEvent {
  final String email;
  final String password;
  final bool rememberMe;

  FetchLogin(
      {required this.email, required this.password, required this.rememberMe});
}

class ToggleRememberMe extends SignInEvent {
  final bool value;
  ToggleRememberMe({required this.value});
}
