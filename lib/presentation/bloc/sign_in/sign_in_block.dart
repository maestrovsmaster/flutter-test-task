import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pixelfield_flutter_task/domain/repositories/sign_in_repository.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/sign_in/sign_in_event.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/sign_in/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepository repository;
  bool rememberMe = false;

  SignInBloc({required this.repository}) : super(SignInInitial()) {
    on<FetchLogin>((event, emit) async {
      emit(SignInLoading());

      try {
        final success = await repository.login(event.email, event.password);

        if (success) {
          if (event.rememberMe) {
            await repository.setLoggedIn(true);
          }
          emit(SignInSuccess());
        } else {
          emit(SignInFailure(message: translate("invalid_email_or_password")));
        }
      } catch (e) {
        emit(SignInFailure(message: translate("error_occurred")));
      }
    });

    on<ToggleRememberMe>((event, emit) {
      rememberMe = event.value;
      emit(RememberMeUpdated(value: event.value));
    });
  }
}
