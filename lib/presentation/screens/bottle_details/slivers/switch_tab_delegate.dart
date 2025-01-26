import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';

typedef TabSelectedCallback = void Function(int selectedIndex);

class SwitchTabDelegate extends SliverPersistentHeaderDelegate {
  final double currentHeight;
  final double minHeight;
  final double maxHeight;
  final String title;
  final String subtitle;
  final int currentTab;
  final TabSelectedCallback onTabSelected;

  SwitchTabDelegate({
    required this.currentHeight,
    required this.minHeight,
    required this.maxHeight,
    required this.title,
    required this.subtitle,
    required this.currentTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      width: double.infinity,
      height: 204,
      child:   Container(
        color: AppColors.cardBackground,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),

            Container(decoration: BoxDecoration(
              color: AppColors.backgroundBottleDetails,
              borderRadius: BorderRadius.circular(6.0),
            ),
                child: Row(
              children: [
                Expanded(child: _buildTab(context, 0, translate("tab_details"))),
                Expanded(child:_buildTab(context, 1, translate("tab_tasting_notes"))),
                Expanded(child:_buildTab(context, 2, translate("tab_history"))),
              ],
            ))
            ,
          ],
        ),
      )
    );


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
        child: Center( child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
