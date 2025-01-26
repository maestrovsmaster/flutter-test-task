import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/auth/auth_event.dart';

import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckAuthStatusEvent>((event, emit) async {

      await Future.delayed(const Duration(seconds: 2));//Mock login delay

      emit(Authenticated('user_id_123'));
      // Mock login failed
      // emit(Unauthenticated());
    });

    on<LoginEvent>((event, emit) async {
      // Mock login
      emit(Authenticated('user_id_123'));
    });

    on<LogoutEvent>((event, emit) async {
      // Mock logout
      emit(Unauthenticated());
    });
  }
}