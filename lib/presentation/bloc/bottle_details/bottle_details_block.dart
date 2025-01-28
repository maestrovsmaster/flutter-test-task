import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pixelfield_flutter_task/core/utils/connectivity_utils.dart';
import 'package:pixelfield_flutter_task/domain/repositories/collection_repository.dart';
import 'package:pixelfield_flutter_task/domain/repositories/local_collection_repository.dart';

import 'bottle_details_event.dart';
import 'bottle_details_state.dart';

class BottleDetailsBloc extends Bloc<BottleDetailsEvent, BottleDetailsState> {
  final CollectionRepository repository;
  final LocalCollectionRepository localRepository;
  final Connectivity connectivity;

  BottleDetailsBloc(
      {required this.repository,
      required this.localRepository,
      required this.connectivity})
      : super(BottleDetailsInitial()) {
    on<FetchBottleDetailsEvent>((event, emit) async {
      emit(BottleDetailsLoading());
      try {
        final hasConnection = await hasInternetConnection(connectivity);

        final cachedItem = localRepository.getItemFromCache(event.itemId);

        if (!hasConnection) {
          debugPrint("Offline");
          debugPrint("Offline $cachedItem   *** cachedItem.isDetailed = ${cachedItem?.isDetailed}");
          if (cachedItem != null && cachedItem.isDetailed) {
            emit(BottleDetailsLoaded(item: cachedItem));
            return;
          } else {
            emit(BottleDetailsError(
              errorMessage: translate('error_no_connection'),
            ));
            return;
          }
        }

        debugPrint("Online");

        if (cachedItem != null && cachedItem.isDetailed) {
          emit(BottleDetailsLoaded(item: cachedItem));
          return;
        }

        debugPrint("Online 2");

        final fetchedItem = await repository.fetchItemDetails(event.itemId);

        debugPrint("Online fetchedItem = $fetchedItem");

        if (fetchedItem != null) {
          localRepository.saveItemToCache(
              event.itemId, fetchedItem.copyWith(isDetailed: true));
          debugPrint("Online saved fetchedItem = $fetchedItem");
          emit(BottleDetailsLoaded(item: fetchedItem));
        } else {
          emit(BottleDetailsError(errorMessage: 'Item not found'));
        }
      } catch (e) {
        emit(BottleDetailsError(errorMessage: e.toString()));
      }
    });
  }
}
