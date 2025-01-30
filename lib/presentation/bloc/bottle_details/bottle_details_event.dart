import 'package:equatable/equatable.dart';

abstract class BottleDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ScrollUpdatedEvent extends BottleDetailsEvent {
  final double position;

  ScrollUpdatedEvent(this.position);
}

class SwitchTabEvent extends BottleDetailsEvent {
  final int tabIndex;

  SwitchTabEvent(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}

class FetchBottleDetailsEvent extends BottleDetailsEvent {
  final String itemId;

  FetchBottleDetailsEvent(this.itemId);

  @override
  List<Object> get props => [itemId];
}

class AddItemToCollectionEvent extends BottleDetailsEvent {
  final String itemId;

  AddItemToCollectionEvent({required this.itemId});

  @override
  List<Object> get props => [itemId];
}

class RemoveItemFromCollectionEvent extends BottleDetailsEvent {
  final String itemId;

  RemoveItemFromCollectionEvent({required this.itemId});

  @override
  List<Object> get props => [itemId];
}

class SelectBottleEvent extends BottleDetailsEvent {
  final String value;
  SelectBottleEvent({required this.value});

  @override
  List<Object> get props => [value];
}
