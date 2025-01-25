
import 'package:equatable/equatable.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';

abstract class PaginationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaginationInitial extends PaginationState {}

class PaginationLoading extends PaginationState {}

class PaginationLoaded extends PaginationState {
  final List<ItemModel> items;
  final bool hasReachedMax;

  PaginationLoaded({required this.items, required this.hasReachedMax});

  PaginationLoaded copyWith({List<ItemModel>? items, bool? hasReachedMax}) {
    return PaginationLoaded(
      items: items ?? this.items,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [items, hasReachedMax];
}

class PaginationError extends PaginationState {}