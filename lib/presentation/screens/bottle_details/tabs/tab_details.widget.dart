import 'package:flutter/material.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';

class TabDetailsWidget extends StatelessWidget {
  const TabDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      color: AppColors.cardBackground,
      alignment: Alignment.center,
      child: const Text(
        'Details Tab Content',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}