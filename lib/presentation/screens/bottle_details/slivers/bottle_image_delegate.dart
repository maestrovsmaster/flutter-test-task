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
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: currentHeight,
        alignment: Alignment.center,
        child: SizedBox(
          height: maxHeight,
          child: Image.asset(
            'assets/images/img_bottle.png',
            fit: BoxFit.contain,
            width: double.infinity,
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