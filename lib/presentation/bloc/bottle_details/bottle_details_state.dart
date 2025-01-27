class BottleDetailsState {
  final int activeTab;

  BottleDetailsState({required this.activeTab});

  BottleDetailsState copyWith({int? activeTab}) {
    return BottleDetailsState(
      activeTab: activeTab ?? this.activeTab,

    );
  }
}