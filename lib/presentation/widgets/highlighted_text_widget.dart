import 'package:flutter/material.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';

class HighlightedTextWidget extends StatelessWidget {
  final String text1;
  final String? textYellow;
  final String text2;
  final int maxLines = 1;

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
        LayoutBuilder(
          builder: (context, constraints) {
            return Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 8,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.8),
                  child: RichText(
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                      ),
                      text: text1,
                    ),
                  ),
                ),
                if (textYellow != null)
                  RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: AppColors.accentColor,
                      ),
                      text: textYellow,
                    ),
                  ),
              ],
            );
          },
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
