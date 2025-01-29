import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter_task/domain/repositories/sign_in_repository.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/main_screen/main_screen_event.dart';

import 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final SignInRepository repository;

  MainScreenBloc({required this.repository})
      : super(MainScreenInitial(selectedIndex: 1, notificationCount: 1)) {

    on<SelectScreen>((event, emit) {
      if (state is MainScreenInitial) {
        final currentState = state as MainScreenInitial;
        emit(currentState.copyWith(selectedIndex: event.index));
      }
    });

    on<UpdateNotifications>((event, emit) {
      if (state is MainScreenInitial) {
        final currentState = state as MainScreenInitial;
        emit(currentState.copyWith(notificationCount: event.count));
      }
    });

    on<LogoutRequested>((event, emit) async {
      await repository.setLoggedIn(false);
      emit(LogoutSuccess());
    });
  }
}
