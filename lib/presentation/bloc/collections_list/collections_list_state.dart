
import 'package:equatable/equatable.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';

abstract class CollectionsListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CollectionInitial extends CollectionsListState {}

class CollectionLoading extends CollectionsListState {}

class CollectionLoaded extends CollectionsListState {
  final List<ItemModel> items;
  final bool hasReachedMax;

  CollectionLoaded({required this.items, required this.hasReachedMax});

  CollectionLoaded copyWith({List<ItemModel>? items, bool? hasReachedMax}) {
    return CollectionLoaded(
      items: items ?? this.items,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [items, hasReachedMax];
}

class CollectionError extends CollectionsListState {
  final String errorMessage;

  CollectionError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}



