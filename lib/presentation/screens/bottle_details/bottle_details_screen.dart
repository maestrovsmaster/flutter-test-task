import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pixelfield_flutter_task/core/di/di_container.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_event.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_state.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/slivers/bottle_image_delegate.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/slivers/popup_menu_delegate.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/slivers/item_title_delegate.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/slivers/tab_bar_persistent_header.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/tabs/details/tab_details.widget.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/close_icon_widget.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/custom_yellow_icon_button.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/error_with_refresh_widget.dart';

import 'tabs/history/tab_history_widget.dart';
import 'tabs/tasting_notes/tab_tasting_notes_widget.dart';

class BottleDetailsScreen extends StatelessWidget {
  final String itemId;

  const BottleDetailsScreen({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BottleDetailsBloc>(),
      child: _BottleDetailsContent(itemId: itemId),
    );
  }
}

class _BottleDetailsContent extends StatefulWidget {
  final String itemId;

  const _BottleDetailsContent({required this.itemId});

  @override
  State<_BottleDetailsContent> createState() => _BottleDetailsContentState();
}

class _BottleDetailsContentState extends State<_BottleDetailsContent>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();

    super.dispose();
  }

  void _onScroll() {
    if (mounted) {
      //final position = _scrollController.position.pixels;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottleDetailsBloc, BottleDetailsState>(
      builder: (context, state) {
        debugPrint("state: $state");

        if (state is BottleDetailsInitial && state is! BottleDetailsLoading) {
          context
              .read<BottleDetailsBloc>()
              .add(FetchBottleDetailsEvent(widget.itemId));
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.accentColor,
          ));
        } else if (state is BottleDetailsLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.accentColor,
          ));
        } else if (state is BottleDetailsError) {
          debugPrint("error ${state.errorMessage}");
          return ErrorWithRefreshWidget(
            errorMessage: state.errorMessage,
            onRefresh: () {
              context
                  .read<BottleDetailsBloc>()
                  .add(FetchBottleDetailsEvent(widget.itemId));
            },
          );
        } else if (state is BottleDetailsLoaded) {

          ItemModel item = state.item;

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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: AppBar(
                            backgroundColor: Colors.transparent,
                            automaticallyImplyLeading: false,
                            title: Text(
                              'Genesis Collection',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
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
                        )),
                    Expanded(
                      child: CustomScrollView(
                        controller: _scrollController,
                        slivers: [
                          SliverPadding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              sliver: SliverPersistentHeader(
                                pinned: true,
                                delegate: PopupMenuDelegate(
                                  currentHeight: 40,
                                  minHeight: 0,
                                  maxHeight: 40,
                                ),
                              )),
                          SliverPersistentHeader(
                            pinned: true,
                            delegate: BottleImageDelegate(
                              currentHeight: 350.0,
                              minHeight: 0.0,
                              maxHeight: 350.0,
                            ),
                          ),
                          SliverPadding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              sliver: SliverPersistentHeader(
                                pinned: true,
                                delegate: ItemTitleDelegate(
                                  item: item,
                                ),
                              )),
                          SliverPadding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              sliver: SliverPersistentHeader(
                                pinned: true,
                                delegate: TabBarPersistentHeaderDelegate(
                                    tabController: _tabController,
                                    onTabSelected: (index) {
                                      context
                                          .read<BottleDetailsBloc>()
                                          .add(SwitchTabEvent(index));
                                    }),
                              )),
                          SliverPadding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              sliver: SliverToBoxAdapter(
                                child: Builder(
                                  builder: (context) {
                                    final StatelessWidget childWidget;
                                    switch (state.activeTab) {
                                      case 0:
                                        childWidget = TabDetailsWidget(
                                          item: item,
                                        );
                                      case 1:
                                        childWidget = TabTastingNotesWidget(
                                          item: item,
                                          scrollController: _scrollController,
                                        );
                                      case 2:
                                        childWidget = TabHistoryWidget(
                                          item: item,
                                        );
                                      default:
                                        return Container();
                                    }

                                    return AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 90),
                                      transitionBuilder: (Widget child,
                                          Animation<double> animation) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                      child: childWidget,
                                    );
                                  },
                                ),
                              )),
                          const SliverPadding(
                            padding: EdgeInsets.only(bottom: 80.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: IntrinsicWidth(
                      child: CustomYellowIconButton(
                        icon: Icons.add,
                        text: "Add to my collections_list",
                        onPressed: () {
                          debugPrint("Button pressed!");
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Placeholder();
        }
      },
    );
  }
}
