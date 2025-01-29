import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';

class MainScreenBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MainScreenBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
        height: 80,
         child: BottomNavigationBar(
          currentIndex: currentIndex,
          showUnselectedLabels: true,
          onTap: onTap,
          items: [
            _buildNavItem(
              context,
              iconPath: 'assets/images/ic_scan.svg',
              label: translate('tab_scan'),
              isSelected: currentIndex == 0,
            ),
            _buildNavItem(
              context,
              iconPath: 'assets/images/ic_collection.svg',
              label: translate('tab_collection'),
              isSelected: currentIndex == 1,
            ),
            _buildNavItem(
              context,
              iconPath: 'assets/images/ic_shop.svg',
              label: translate('tab_shop'),
              isSelected: currentIndex == 2,
            ),
            _buildNavItem(
              context,
              iconPath: 'assets/images/ic_settings.svg',
              label: translate('tab_settings'),
              isSelected: currentIndex == 3,
            ),
          ],
        )));
  }

  BottomNavigationBarItem _buildNavItem(
    BuildContext context, {
    String? iconPath,
    IconData? icon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: AppColors.tabBackground,

      icon: iconPath != null
          ? SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedItemColor!
                    : Colors.grey,
                BlendMode.srcIn,
              ),
            )
          : Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
      label: translate(label),
    );
  }
}
