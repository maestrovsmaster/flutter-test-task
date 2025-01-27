import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/domain/repositories/collection_repository.dart';
import 'package:pixelfield_flutter_task/domain/repositories/local_collection_repository.dart';

import 'collection_event.dart';
import 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final CollectionRepository repository;
  final LocalCollectionRepository localRepository;
  final Connectivity connectivity;
  static const int _pageSize = 10;
  int _currentPage = 1;

  CollectionBloc(
      {required this.repository,
      required this.localRepository,
      required this.connectivity})
      : super(CollectionInitial()) {
    on<FetchItemsEvent>((event, emit) async {
      if (state is CollectionLoaded &&
          (state as CollectionLoaded).hasReachedMax) {
        return;
      }

      try {
        if (state is CollectionInitial || state is CollectionLoading) {
          emit(CollectionLoading());
          _currentPage = 1;
        } else {
          _currentPage++;
        }

        final connectivityResult = await connectivity.checkConnectivity();
        final allowedConnections = [
          ConnectivityResult.mobile,
          ConnectivityResult.wifi
        ];
        debugPrint("connectivityResult = $connectivityResult");
        final hasMatchingConnection = connectivityResult.any((result) => allowedConnections.contains(result));

        if (!hasMatchingConnection) {
          debugPrint("Offline");
          if (localRepository.hasCachedItems()) {
            final cachedItems = localRepository.getItems(page: _currentPage, limit: _pageSize);

            if (cachedItems.isNotEmpty) {
              emit(CollectionLoaded(
                items: cachedItems,
                hasReachedMax: false,
              ));
            } else {

              final allCachedItems = localRepository.getItems(page: 1, limit: _currentPage * _pageSize);
              emit(CollectionLoaded(
                items: allCachedItems,
                hasReachedMax: true,
              ));
            }
            return;
          } else {
            emit(CollectionError(
              errorMessage: translate('error_no_connection'),
            ));
          }
          return;
        }
        debugPrint("Online");

        final List<ItemModel> newItems = await repository.getItems(
          page: _currentPage,
          limit: _pageSize,
        );


        if (_currentPage == 1) {
          await localRepository.saveAllItems(newItems);
        } else {
          final existingItems = localRepository.getItems(
              page: 1, limit: _currentPage * _pageSize);
          final updatedItems = existingItems + newItems;
          await localRepository.saveAllItems(updatedItems);
        }

        if (state is CollectionLoaded) {
          final loadedState = state as CollectionLoaded;
          emit(
            CollectionLoaded(
              items: loadedState.items + newItems,
              hasReachedMax: newItems.isEmpty,
            ),
          );
        } else {
          emit(
            CollectionLoaded(
              items: newItems,
              hasReachedMax: newItems.isEmpty,
            ),
          );
        }
      } catch (e) {
        emit(CollectionError(errorMessage: e.toString()));
      }
    });
  }
}
