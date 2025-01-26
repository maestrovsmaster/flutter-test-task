import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottle_details_state.dart';

class BottleDetailsBloc extends Cubit<BottleDetailsState> {
  BottleDetailsBloc() : super(BottleDetailsInitial());

  void scrollUpdated(double position) {
    emit(BottleDetailsScrolling(position));
  }
}