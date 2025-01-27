import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_event.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_state.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/slivers/bottle_image_delegate.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/slivers/popup_menu_delegate.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/slivers/switch_tab_delegate.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/tabs/tab_details.widget.dart';

import 'tabs/tab_history_widget.dart';
import 'tabs/tab_tasting_notes_widget.dart';

class BottleDetailsScreen extends StatelessWidget {
  final ItemModel item;

  const BottleDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottleDetailsBloc(),
      child: _BottleDetailsContent(item: item),
    );
  }
}

class _BottleDetailsContent extends StatefulWidget {
  final ItemModel item;

  const _BottleDetailsContent({super.key, required this.item});

  @override
  State<_BottleDetailsContent> createState() => _BottleDetailsContentState();
}

class _BottleDetailsContentState extends State<_BottleDetailsContent> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (mounted) {
      final position = _scrollController.position.pixels;
     // context.read<BottleDetailsBloc>().add(ScrollUpdatedEvent(position));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottleDetailsBloc, BottleDetailsState>(
      builder: (context, state) {

        int currentTab = 0;
        currentTab = state.activeTab;

        return Scaffold(
          backgroundColor: AppColors.backgroundBottleDetails,
          body: Stack(
            children: [

              SizedBox.expand(
                child: Image.asset(
                  'assets/images/img_bottle_background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [

                  PreferredSize(
                    preferredSize: const Size.fromHeight(72),
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      title: const Text(
                        'Genesis Collection',
                        style: TextStyle(color: Colors.white),
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  ),


                  Expanded(
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: [

                        SliverPersistentHeader(
                          pinned: true,
                          delegate: PopupMenuDelegate(
                            currentHeight: 40,
                            minHeight: 0,
                            maxHeight: 40,
                          ),
                        ),


                        SliverPersistentHeader(
                          pinned: true,
                          delegate: BottleImageDelegate(
                            currentHeight: 350.0,
                            minHeight: 0.0,
                            maxHeight: 350.0,
                          ),
                        ),


                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          sliver: SliverPersistentHeader(
                            pinned: true,
                            delegate: SwitchTabDelegate(
                              item: widget.item,
                             // currentHeight: 244,
                             // minHeight: 240maxHeight: 520,

                              currentTab: currentTab,
                              onTabSelected: (selectedIndex) {
                                context
                                    .read<BottleDetailsBloc>()
                                    .add(SwitchTabEvent(selectedIndex));
                              },
                            ),
                          )
                        )
                        ,

                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      sliver:
                        SliverToBoxAdapter(
                          child: Builder(
                            builder: (context) {
                              if (state is BottleDetailsState) {
                                switch (state.activeTab) {
                                  case 0:
                                    return TabDetailsWidget();
                                  case 1:
                                    return TabTastingNotesWidget();
                                  case 2:
                                    return TabHistoryWidget();
                                  default:
                                    return Container();
                                }
                              }
                              return Container();
                            },
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}



