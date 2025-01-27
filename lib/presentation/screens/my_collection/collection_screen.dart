import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter_task/core/di/di_container.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/collection/collection_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/collection/collection_event.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/collection/collection_state.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/collection_item.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/error_with_refresh_widget.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  static const itemCardSizeRatio = 1.86;
  static const crossAxisSpacing = 8.0;
  static const horizontalPadding = 16.0;
  static const crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<CollectionBloc>(),
        child: BlocBuilder<CollectionBloc, CollectionState>(
          builder: (context, state) {
            if (state is CollectionLoading && state is! CollectionLoaded) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CollectionLoaded) {
              final items = state.items;

              final itemRatio = calculateChildAspectRatio(context);
              return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent &&
                      !state.hasReachedMax) {
                    context.read<CollectionBloc>().add(FetchItemsEvent());
                  }
                  return false;
                },
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: horizontalPadding),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: crossAxisSpacing,
                    mainAxisSpacing: crossAxisSpacing,
                    childAspectRatio: itemRatio,
                  ),
                  itemCount:
                      state.hasReachedMax ? items.length : items.length + 1,
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
              debugPrint("error ${state.errorMessage}");
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
        ));
  }

  double calculateChildAspectRatio(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const totalSpacing = (crossAxisCount - 1) * crossAxisSpacing +
        crossAxisCount * horizontalPadding;
    final itemWidth = (screenWidth - totalSpacing) / crossAxisCount;
    final itemHeight = itemWidth * itemCardSizeRatio;
    return itemWidth / itemHeight;
  }
}
