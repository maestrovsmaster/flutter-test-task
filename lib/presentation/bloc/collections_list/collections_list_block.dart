import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pixelfield_flutter_task/core/utils/connectivity_utils.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/domain/repositories/collection_repository.dart';
import 'package:pixelfield_flutter_task/domain/repositories/local_collection_repository.dart';

import 'collections_list_event.dart';
import 'collections_list_state.dart';

class CollectionsListBloc extends Bloc<CollectionsListEvent, CollectionsListState> {
  final CollectionRepository repository;
  final LocalCollectionRepository localRepository;
  final Connectivity connectivity;
  static const int _pageSize = 10;
  int _currentPage = 1;

  CollectionsListBloc(
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

        final hasConnection = await hasInternetConnection(connectivity);

        if (!hasConnection) {
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
