import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottle_details_event.dart';
import 'bottle_details_state.dart';

class BottleDetailsBloc extends Bloc<BottleDetailsEvent, BottleDetailsState> {

  BottleDetailsBloc() : super(BottleDetailsState(activeTab: 2)) {
    on<SwitchTabEvent>((event, emit) {
      emit(state.copyWith(activeTab: event.tabIndex));
    });
  }


}