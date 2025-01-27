import 'package:flutter/material.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/data/models/history_event.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/tabs/history/history_widgets/history_widgets.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/tabs/history/history_widgets/timeline_widget.dart';


class TabHistoryWidget extends StatelessWidget {
  final ItemModel item;

  const TabHistoryWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final history = item.history!;
    history.sort((a, b) => b.dateTime!
        .compareTo(a.dateTime!)); // Order by date in descending order

    return Container(
        color: AppColors.cardBackground,
        alignment: Alignment.center,
        child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
            child: Container(
                color: AppColors.background,
                alignment: Alignment.center,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final historyEventType = index == 0
                        ? HistoryEventType.last
                        : index == history.length - 1
                            ? HistoryEventType.first
                            : HistoryEventType.middle;
                    return _HistoryEventCard(
                        event: history[index], eventType: historyEventType);
                  },
                ))));
  }
}

class _HistoryEventCard extends StatelessWidget {
  final HistoryEvent event;
  final HistoryEventType eventType;

  const _HistoryEventCard({
    required this.event,
    required this.eventType,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 16),

        SizedBox(
          height: double.infinity,
          width: 32,
          child: CustomPaint(
            painter: TimelinePainter(eventType: eventType),
          ),
        ),

        const SizedBox(width: 24),
        // Event details
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 0, left: 16, bottom: 40, right: 16),
            child: buildEventDescriptionWidget(context, event),
          ),
        ),
      ],
    ));
  }
}

enum HistoryEventType { first, middle, last }
