import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottleImageDelegate extends SliverPersistentHeaderDelegate {
  final double currentHeight;
  final double minHeight;
  final double maxHeight;

  BottleImageDelegate({
    required this.currentHeight,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final imageHeight = 0.8*maxHeight;
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: ClipRect(
        child: OverflowBox(
          maxHeight: imageHeight,
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/img_bottle.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  bool shouldRebuild(covariant BottleImageDelegate oldDelegate) {
    return oldDelegate.currentHeight != currentHeight;
  }
}