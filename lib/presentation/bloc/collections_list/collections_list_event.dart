import 'package:equatable/equatable.dart';

abstract class CollectionsListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchItemsEvent extends CollectionsListEvent {}

