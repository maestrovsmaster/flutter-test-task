import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter_task/core/utils/grid_utils.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/collection/collection_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/collection/collection_event.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/collection/collection_state.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/collection_item.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/error_with_refresh_widget.dart';

class ItemGridScreen extends StatelessWidget {
  const ItemGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionBloc, CollectionState>(
      builder: (context, state) {
        if (state is CollectionLoading && state is! CollectionLoaded) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CollectionLoaded) {
          final items = state.items;

          print("state.hasReachedMax = ${state.hasReachedMax}");

          final itemRatio = calculateChildAspectRatio(context);
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
                  !state.hasReachedMax) {
                context.read<CollectionBloc>().add(FetchItemsEvent());
              }
              return false;
            },
            child: GridView.builder(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: itemRatio,
              ),
              itemCount: state.hasReachedMax ? items.length : items.length + 1,
              itemBuilder: (context, index) {

                if (index >= items.length) {
                  if (!state.hasReachedMax) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }
              return CollectionItem(item: items[index]);
              },
            ),
          );
        } else if (state is CollectionError) {
          print("error ${state.errorMessage}");
          return ErrorWithRefreshWidget(
            errorMessage: state.errorMessage,
            onRefresh: () {
              context.read<CollectionBloc>().add(FetchItemsEvent());
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
