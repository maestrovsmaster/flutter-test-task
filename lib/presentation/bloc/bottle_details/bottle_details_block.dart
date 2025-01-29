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
    on<SwitchTabEvent>((event, emit) {
      if (state is BottleDetailsLoaded) {
        emit(
            (state as BottleDetailsLoaded).copyWith(activeTab: event.tabIndex));
      }
    });

    on<FetchBottleDetailsEvent>((event, emit) async {
      emit(BottleDetailsLoading());
      try {
        final hasConnection = await hasInternetConnection(connectivity);

        final cachedItem = localRepository.getItemFromCache(event.itemId);

        final isAdded = localRepository.isItemAddedToCollection(event.itemId);

        if (!hasConnection) {
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

        if (cachedItem != null && cachedItem.isDetailed) {
          emit(BottleDetailsLoaded(item: cachedItem, isAdded: isAdded));
          return;
        }

        final fetchedItem = await repository.fetchItemDetails(event.itemId);

        if (fetchedItem != null) {
          localRepository.saveItemToCache(
              event.itemId, fetchedItem.copyWith(isDetailed: true));

          emit(BottleDetailsLoaded(item: fetchedItem, isAdded: isAdded));
        } else {
          emit(BottleDetailsError(errorMessage: 'Item not found'));
        }
      } catch (e) {
        emit(BottleDetailsError(errorMessage: e.toString()));
      }
    });
    on<AddItemToCollectionEvent>((event, emit) async {
      localRepository.addItemToCollection(event.itemId);
      emit((state as BottleDetailsLoaded).copyWith(isAdded: true));
    });
    on<RemoveItemFromCollectionEvent>((event, emit) async {
      localRepository.removeItemFromCollection(event.itemId);
      emit((state as BottleDetailsLoaded).copyWith(isAdded: false));
    });

    on<SelectBottleEvent>((event, emit) async {
      emit((state as BottleDetailsLoaded).copyWith(selectedBottle: event.value));
    });
  }
}
