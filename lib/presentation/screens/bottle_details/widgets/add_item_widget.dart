import 'package:flutter/material.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/custom_yellow_icon_button.dart';

class AddItemWidget extends StatelessWidget {
  final bool isAdded;
  final VoidCallback onAdded;
  final VoidCallback onRemoved;

  const AddItemWidget({
    super.key,
    required this.isAdded,
    required this.onAdded,
    required this.onRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return CustomYellowIconButton(
      icon: isAdded ? Icons.check : Icons.add,
      text: isAdded ? "Remove from collection" : "Add to my collection",
      backgroundColor: isAdded ? AppColors.secondaryText2 : AppColors.accentColor,
      textColor: isAdded ? Colors.white : Colors.black,
      onPressed: isAdded ? onRemoved : onAdded,
    );
  }
}
