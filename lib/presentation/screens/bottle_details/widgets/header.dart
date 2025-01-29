import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/close_icon_widget.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(72),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            'Genesis Collection',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.primaryText,
            ),
          ),
          actions: [
            CloseIconWidget(
              size: 40.0,
              iconSize: 24.0,
              onClose: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}