abstract class MainScreenEvent {}

class SelectScreen extends MainScreenEvent {
  final int index;
  SelectScreen(this.index);
}

class UpdateNotifications extends MainScreenEvent {
  final int count;
  UpdateNotifications(this.count);
}

