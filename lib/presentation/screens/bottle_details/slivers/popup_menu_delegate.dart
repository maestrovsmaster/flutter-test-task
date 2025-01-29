import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/popup_bottle_menu_widget.dart';
class PopupMenuDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final double currentHeight;
  final double minHeight;
  final double maxHeight;
  final Function(String) onSelected;

  PopupMenuDelegate({
    required this.title,
    required this.currentHeight,
    required this.minHeight,
    required this.maxHeight,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return PopupBottleMenuWidget(title: title, onSelected: (value) {
      onSelected(value);
    }, isExpanded: false);
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