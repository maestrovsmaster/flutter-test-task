import 'package:flutter/material.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';

class CustomYellowIconButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onPressed;
  final double height;
  final Color backgroundColor;
  final Color textColor;

  const CustomYellowIconButton({
    super.key,
    this.icon,
    required this.text,
    required this.onPressed,
    this.height = 40,
    this.backgroundColor = AppColors.accentColor,
    this.textColor = AppColors.backgroundBottleDetails,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (icon != null) {
      children.add(Icon(icon, color: textColor));
      children.add(const SizedBox(width: 16));
    }
    children.add(Text(
      text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
    ));

    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }


}
