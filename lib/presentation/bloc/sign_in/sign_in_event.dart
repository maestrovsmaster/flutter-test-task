abstract class SignInEvent {}

class FetchLogin extends SignInEvent {
  final String email;
  final String password;

  FetchLogin({required this.email, required this.password});
}