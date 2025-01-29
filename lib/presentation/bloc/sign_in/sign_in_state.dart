import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {
  final String mockEmail = "test@email.com";
  final String mockPassword = "password123";

  @override
  List<Object?> get props => [mockEmail, mockPassword];
}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailure extends SignInState {
  final String message;

  SignInFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class RememberMeUpdated extends SignInState {
  final bool value;
  RememberMeUpdated({required this.value});

  @override
  List<Object?> get props => [value];

}