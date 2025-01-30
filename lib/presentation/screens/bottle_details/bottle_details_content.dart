import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_event.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_state.dart';

import 'slivers/bottle_image_delegate.dart';
import 'slivers/item_title_delegate.dart';
import 'slivers/popup_menu_delegate.dart';
import 'slivers/tab_bar_persistent_header.dart';
import 'widgets/tab_content.dart';

class BottleDetailsContent extends StatefulWidget {
  final ItemModel item;

  const BottleDetailsContent({super.key, required this.item});

  @override
  State<BottleDetailsContent> createState() => _BottleDetailsContentState();
}

class _BottleDetailsContentState extends State<BottleDetailsContent>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverPersistentHeader(
            pinned: true,
            delegate: PopupMenuDelegate(
              title: context.select((BottleDetailsBloc bloc) => (bloc.state as BottleDetailsLoaded).selectedBottle),
              currentHeight: 40,
              minHeight: 0,
              maxHeight: 40, onSelected: (String ) {
                context.read<BottleDetailsBloc>().add(SelectBottleEvent(value: String));
            },
            ),
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
            delegate: ItemTitleDelegate(item: widget.item),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverPersistentHeader(
            pinned: true,
            delegate: TabBarPersistentHeaderDelegate(
              tabController: _tabController,
              onTabSelected: (index) {
                context.read<BottleDetailsBloc>().add(SwitchTabEvent(index));
              },
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverToBoxAdapter(
            child: TabContent(
              activeTab: context.select((BottleDetailsBloc bloc) => (bloc.state as BottleDetailsLoaded).activeTab),
              item: widget.item,
              scrollController: _scrollController,
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 80.0),
        ),
      ],
    );
  }
}