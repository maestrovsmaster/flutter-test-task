import 'package:flutter/material.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/tabs/details/tab_details.widget.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/tabs/history/tab_history_widget.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/tabs/tasting_notes/tab_tasting_notes_widget.dart';

class TabContent extends StatelessWidget {
  final int activeTab;
  final ItemModel item;
  final ScrollController scrollController;

  const TabContent({super.key,
    required this.activeTab,
    required this.item,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final StatelessWidget childWidget;
    switch (activeTab) {
      case 0:
        childWidget = TabDetailsWidget(item: item);
        break;
      case 1:
        childWidget = TabTastingNotesWidget(
          item: item,
          scrollController: scrollController,
        );
        break;
      case 2:
        childWidget = TabHistoryWidget(item: item);
        break;
      default:
        return Container();
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 90),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: childWidget,
    );
  }
}