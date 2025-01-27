import 'package:flutter/material.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';

class HighlightedTextWidget extends StatelessWidget {
  final String text1;
  final String? textYellow;
  final String text2;

  const HighlightedTextWidget({
    super.key,
    required this.text1,
    this.textYellow,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: text1,
              ),
              if (textYellow != null)
                TextSpan(
                  text: textYellow,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.accentColor,
                  ),
                ),
            ],
          ),
        ),
        Text(
          text2,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
