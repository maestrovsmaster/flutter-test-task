import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/domain/repositories/collection_repository.dart';

import 'collection_event.dart';
import 'collection_state.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  final CollectionRepository repository;
  final Box<ItemModel> cacheBox;
  final Connectivity connectivity;
  static const int _pageSize = 10;
  int _currentPage = 1;

  PaginationBloc({required this.repository, required this.cacheBox, required this.connectivity}) : super(PaginationInitial()) {

    on<FetchItemsEvent>((event, emit) async {
      print("onFetchItemsEvent");
      if (state is PaginationLoaded && (state as PaginationLoaded).hasReachedMax) return;

      try {
        if (state is PaginationInitial || state is PaginationLoading) {
          emit(PaginationLoading());
          _currentPage = 1;
        } else {
          _currentPage++;
        }

        final connectivityResult = await connectivity.checkConnectivity();
        final allowedConnections = [ConnectivityResult.mobile, ConnectivityResult.wifi];


        if (!connectivityResult.any((result) => allowedConnections.contains(result))) {

          if (cacheBox.isNotEmpty) {
            final cachedItems = cacheBox.values.toList().cast<ItemModel>();
            emit(PaginationLoaded(items: cachedItems, hasReachedMax: true));
          } else {
            emit(PaginationError());
          }
        } else{

        print("_currentPage = $_currentPage");
          final List<ItemModel> newItems = await repository.getItems(
            page: _currentPage,
            limit: _pageSize,
          );


        print("newItems = $newItems");

          if (_currentPage == 1) {
            await cacheBox.clear();
          }
          await cacheBox.addAll(newItems);

          if (state is PaginationLoaded) {
            final loadedState = state as PaginationLoaded;
            emit(
              PaginationLoaded(
                items: loadedState.items + newItems,
                hasReachedMax: newItems.isEmpty,
              ),
            );
          } else {
            emit(
              PaginationLoaded(
                items: newItems,
                hasReachedMax: newItems.isEmpty,
              ),
            );
          }
        }
      } catch (e) {
        emit(PaginationError());
      }
    });
  }
}
