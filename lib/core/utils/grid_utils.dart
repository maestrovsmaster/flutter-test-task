import 'package:flutter/cupertino.dart';

double calculateChildAspectRatio(BuildContext context, {int columns = 2, int rows = 2}) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  final itemWidth = screenWidth / columns;
  final itemHeight = screenHeight / rows;
  return itemWidth / itemHeight;
}