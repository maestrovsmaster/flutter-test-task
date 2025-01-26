abstract class BottleDetailsState {}

class BottleDetailsInitial extends BottleDetailsState {}

class BottleDetailsScrolling extends BottleDetailsState {
  final double scrollPosition;

  BottleDetailsScrolling(this.scrollPosition);
}