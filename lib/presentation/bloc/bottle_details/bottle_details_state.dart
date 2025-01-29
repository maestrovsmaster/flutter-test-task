import 'package:equatable/equatable.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';

abstract class BottleDetailsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class BottleDetailsInitial extends BottleDetailsState {}

class BottleDetailsLoading extends BottleDetailsState {}

class BottleDetailsLoaded extends BottleDetailsState {
  final ItemModel item;
  final int activeTab;
  final bool isAdded;
  final String selectedBottle;


  BottleDetailsLoaded({required this.item, this.activeTab = 0,  this.isAdded= false, this.selectedBottle = "Genuine Bottle (Unopened)"});

  BottleDetailsLoaded copyWith({ItemModel? item, int? activeTab, bool? isAdded, String? selectedBottle }) {
    return BottleDetailsLoaded(
      item: item ?? this.item,
      activeTab: activeTab ?? this.activeTab,
      isAdded: isAdded ?? this.isAdded,
      selectedBottle: selectedBottle ?? this.selectedBottle,
    );
  }

  @override
  List<Object?> get props => [item, activeTab, isAdded, selectedBottle];

}

class BottleDetailsError extends BottleDetailsState {
  final String errorMessage;

  BottleDetailsError({required this.errorMessage});
}





