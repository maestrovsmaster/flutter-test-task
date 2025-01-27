class MainScreenState {
  final int selectedIndex;
  final int notificationCount;

  MainScreenState({required this.selectedIndex, this.notificationCount = 0});

  MainScreenState copyWith({int? selectedIndex, int? notificationCount}) {
    return MainScreenState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      notificationCount: notificationCount ?? this.notificationCount,
    );
  }
}