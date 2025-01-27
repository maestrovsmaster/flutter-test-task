import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/main_screen/main_screen_event.dart';

import 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenState(selectedIndex: 1, notificationCount: 1)) {

    on<SelectScreen>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });

    on<UpdateNotifications>((event, emit) {
      emit(state.copyWith(notificationCount: event.count));
    });
  }
}


