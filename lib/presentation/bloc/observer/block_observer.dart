import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_block.dart';

class BottleDetailsBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (bloc is BottleDetailsBloc) {
      if(kDebugMode) {
        debugPrint('BottleDetailsBloc Event: $event');
      }
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is BottleDetailsBloc) {
      if(kDebugMode) {
        debugPrint('BottleDetailsBloc State Changed: $change');
      }
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (bloc is BottleDetailsBloc) {
      if(kDebugMode) {
        debugPrint('BottleDetailsBloc Error: $error');
      }
    }
  }
}