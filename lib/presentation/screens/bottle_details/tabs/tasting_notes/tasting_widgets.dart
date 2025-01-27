import 'package:flutter/material.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';

Widget buildTastingNotesSection(BuildContext context, String title, String description) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.background,
      borderRadius: BorderRadius.circular(0.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    ),
  );
}