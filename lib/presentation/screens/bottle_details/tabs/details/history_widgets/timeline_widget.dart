import 'package:flutter/material.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/tabs/history/tab_history_widget.dart';

class TimelinePainter extends CustomPainter {
  HistoryEventType eventType;

  TimelinePainter({required this.eventType});

  @override
  void paint(Canvas canvas, Size size) {

    const circleYOffset = 24.0;
    final x = size.width / 2;
    const centralDiamondSize = 7;
    final centralDiamondY = size.height / 2;
    final topSmallDiamondY = centralDiamondY - 6 - centralDiamondSize;
    final bottomSmallDiamondY = centralDiamondY + 6 + 2 * centralDiamondSize + 1.5;

    final mainLineYTo = eventType == HistoryEventType.first ?  size.height - 32 : size.height;

    if (eventType != HistoryEventType.last) {
      _drawVerticalLine(canvas, x, 0, circleYOffset, 1, AppColors.accentColor);
    }

    _drawVerticalLine(
        canvas, x, circleYOffset, mainLineYTo, 1, AppColors.accentColor);

    _drawCircle(canvas, x, circleYOffset, 12, Colors.white);

    _drawDiamond(canvas, x, topSmallDiamondY, 3, AppColors.accentColor);
    _drawDiamond(canvas, x, centralDiamondY, 7, AppColors.accentColor);
    _drawDiamond(canvas, x, bottomSmallDiamondY, 3, AppColors.accentColor);

    if (eventType == HistoryEventType.first) {
      _drawDiamond(canvas, x, mainLineYTo, 2, AppColors.accentColor);
    }
  }

  _drawVerticalLine(Canvas canvas, double x, double y1, double y2,
      double stroke, Color color) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = stroke;

    final lineStart = Offset(x, y1);
    final lineEnd = Offset(x, y2);
    canvas.drawLine(lineStart, lineEnd, paint);
  }

  _drawCircle(Canvas canvas, double x, double y, double radius, Color color) {
    final circlePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(x, y), radius, circlePaint);
  }

  _drawDiamond(Canvas canvas, double x, double y, double size, Color color) {
    final paint = Paint()..color = color;
    final diamondPath = Path()
      ..moveTo(x, y)
      ..lineTo(x + size, y + size)
      ..lineTo(x, y + 2 * size)
      ..lineTo(x - size, y + size)
      ..close();
    canvas.drawPath(diamondPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

