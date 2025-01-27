abstract class BottleDetailsEvent {}

class ScrollUpdatedEvent extends BottleDetailsEvent {
  final double position;
  ScrollUpdatedEvent(this.position);
}

class SwitchTabEvent extends BottleDetailsEvent {
  final int tabIndex;
  SwitchTabEvent(this.tabIndex);
}
