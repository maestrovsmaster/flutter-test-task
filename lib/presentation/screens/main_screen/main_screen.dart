import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/main_screen/main_screen_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/main_screen/main_screen_event.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/main_screen/main_screen_state.dart';
import 'package:pixelfield_flutter_task/presentation/screens/my_collection/collection_screen.dart';
import 'package:pixelfield_flutter_task/presentation/screens/placeholder_screen/placeholder_screen.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/notifications_widget.dart';

import '../placeholder_screen/main_screen_bottom_navigation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainScreenBloc(),
      child: BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<MainScreenBloc>(context);

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(72),
          child:
            AppBar(
              title: Text(_getTitle(state.selectedIndex),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              actions: [
                Stack(
                  children: [

                    NotificationsWidget(
                      hasNotifications: state.notificationCount > 0,
                      onClick: () {
                        print('Bell icon clicked!');
                        // TODO: Implement notification functionality
                      },
                    )
                  ],
                ),
              ],
            )),
            body: _getSelectedScreen(state.selectedIndex),
            bottomNavigationBar: MainScreenBottomNavigationBar(
              currentIndex: state.selectedIndex,
              onTap: (index) {
                bloc.add(SelectScreen(index));
              },
            )
          );
        },
      ),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return translate('tab_scan');
      case 1:
        return translate('my_collection');
      case 2:
        return translate('tab_shop');
      case 3:
        return translate('tab_settings');
      default:
        return '';
    }
  }

  Widget _getSelectedScreen(int index) {
    switch (index) {
      case 0:
        return PlaceholderScreen(title: translate('tab_scan'));
      case 1:
        return const CollectionScreen();
      case 2:
        return PlaceholderScreen(title: translate('tab_shop'));
      case 3:
        return PlaceholderScreen(title: translate('tab_settings'));
      default:
        return Container();
    }
  }
}
