import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/core/utils/utils.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/highlighted_text_widget.dart';

typedef TabSelectedCallback = void Function(int selectedIndex);

class SwitchTabDelegate extends SliverPersistentHeaderDelegate {
  final ItemModel item;


  final double height = 200;

  final int currentTab;
  final TabSelectedCallback onTabSelected;

  SwitchTabDelegate({
    required this.item,
    required this.currentTab,
    required this.onTabSelected,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bottlesText = item.count != null
        ? translate('bottle', args: {
            'number': item.count.toString(),
            'total': item.total != null ? item.total.toString() : ''
          })
        : "";

    final title = item.name;
    final vineAge = item.year != null
        ? translate('year_old',
            args: {'age': calculateWineAge(item.year!).toString()})
        : "";
    final batchNumber = item.batchNumber != null ? "#${item.batchNumber}" : "";

    return SizedBox(
        width: double.infinity,
        height: height,
        child: Container(
          color: AppColors.cardBackground,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bottlesText,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryText2,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),

              HighlightedTextWidget(
                text1: "$title ",
                textYellow: vineAge,
                text2: batchNumber,
              ),
              const SizedBox(height: 4),
              const SizedBox(height: 16),
              Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundBottleDetails,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child:
                              _buildTab(context, 0, translate("tab_details"))),
                      Expanded(
                          child: _buildTab(
                              context, 1, translate("tab_tasting_notes"))),
                      Expanded(
                          child:
                              _buildTab(context, 2, translate("tab_history"))),
                    ],
                  )),
            ],
          ),
        ));
  }

  Widget _buildTab(BuildContext context, int index, String label) {
    final isActive = index == currentTab;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        height: 34,
        margin: const EdgeInsets.only(right: 0.0),
        decoration: BoxDecoration(
          color: isActive ? AppColors.accentColor : Colors.transparent,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(
            child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isActive ? Colors.black : Colors.white,
              ),
        )),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
