
import 'package:equatable/equatable.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';

abstract class CollectionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CollectionInitial extends CollectionState {}

class CollectionLoading extends CollectionState {}

class CollectionLoaded extends CollectionState {
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

class CollectionError extends CollectionState {
  final String errorMessage;

  CollectionError({required this.errorMessage});
}

class CollectionLoadingMore extends CollectionState {
  final List<ItemModel> items;

  CollectionLoadingMore(this.items);

  @override
  List<Object> get props => [items];
}
