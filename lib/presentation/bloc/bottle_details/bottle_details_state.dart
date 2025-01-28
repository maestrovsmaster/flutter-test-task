import 'package:pixelfield_flutter_task/data/models/item_model.dart';

abstract class BottleDetailsState {
  const BottleDetailsState();
}

class BottleDetailsInitial extends BottleDetailsState {}

class BottleDetailsLoading extends BottleDetailsState {}

class BottleDetailsLoaded extends BottleDetailsState {
  final ItemModel item;
  final int activeTab;

  BottleDetailsLoaded({required this.item, this.activeTab = 0});

  BottleDetailsLoaded copyWith({ItemModel? item, int? activeTab}) {
    return BottleDetailsLoaded(
      item: item ?? this.item,
      activeTab: activeTab ?? this.activeTab,
    );
  }
}

class BottleDetailsError extends BottleDetailsState {
  final String errorMessage;

  BottleDetailsError({required this.errorMessage});
}

