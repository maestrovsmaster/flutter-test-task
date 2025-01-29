import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';

class TabBarPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final double height = 80;

  final Function(int) onTabSelected;

  TabBarPersistentHeaderDelegate(
      {required this.tabController, required this.onTabSelected});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Container(
        color: AppColors.cardBackground,
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: TabBar(
            controller: tabController,
            isScrollable: false,
           // indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsets.zero,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.circular(6.0),
            ),
            onTap: (index) {
              onTabSelected(index);
            },
            labelColor: AppColors.backgroundBottleDetails,
            unselectedLabelColor: AppColors.tabInactive,
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
            tabs: [
              _buildTab(context, translate("tab_details")),
              _buildTab(context, translate("tab_tasting_notes")),
              _buildTab(context, translate("tab_history")),
            ],
          ),
        ),
      ),
    );
  }

  Tab _buildTab(BuildContext context, String label) {
    debugPrint("label: $label");
    return Tab(
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: FittedBox(
              child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
          )),
        ),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
