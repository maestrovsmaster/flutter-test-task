import 'package:flutter/material.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';

class PopupBottleMenuWidget extends StatelessWidget {
  final Function(String) onSelected;
      final bool isExpanded;

  const PopupBottleMenuWidget({super.key, required this.onSelected, required this.isExpanded});

  @override
  Widget build(BuildContext context, ) {
    return   Container(
      color: Colors.black54,
      child: Center(
        child: PopupMenuButton<String>(
          onSelected: (value) {
            debugPrint('Selected: $value');
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(value: 'Item 1', child: Text('Item 1')),
            const PopupMenuItem(value: 'Item 2', child: Text('Item 2')),
            const PopupMenuItem(value: 'Item 3', child: Text('Item 3')),
          ],
          child:  SizedBox(
            height: 40,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              decoration: BoxDecoration(
                color: AppColors.backgroundBottleDetails,
                borderRadius: BorderRadius.circular(0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset(
                          'assets/images/img_genuine.png',
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Genuine Bottle (Unopened)",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.accentColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
