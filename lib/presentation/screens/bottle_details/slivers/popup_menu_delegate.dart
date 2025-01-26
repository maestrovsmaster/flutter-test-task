import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
class PopupMenuDelegate extends SliverPersistentHeaderDelegate {
  final double currentHeight;
  final double minHeight;
  final double maxHeight;

  PopupMenuDelegate({
    required this.currentHeight,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: PopupMenuButton<String>(
          onSelected: (value) {
            print('Selected: $value');
            // Додайте дію для вибраного елемента
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(value: 'Item 1', child: Text('Item 1')),
            PopupMenuItem(value: 'Item 2', child: Text('Item 2')),
            PopupMenuItem(value: 'Item 3', child: Text('Item 3')),
          ],
          child:  SizedBox(
            height: 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              decoration: BoxDecoration(
                color: AppColors.backgroundBottleDetails,
                borderRadius: BorderRadius.circular(0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset(
                          'assets/images/img_genuine.png',
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Genuine Bottle (Unopened)",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.accentColor,
                  ),
                ],
              ),
            ),
          ),
        ),
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