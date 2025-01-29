abstract class SignInState {}

class SignInInitial extends SignInState {
  final String mockEmail = "test@email.com";
  final String mockPassword = "password123";
}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailure extends SignInState {
  final String message;

  SignInFailure({required this.message});
}

class RememberMeUpdated extends SignInState {
  final bool value;
  RememberMeUpdated({required this.value});
}