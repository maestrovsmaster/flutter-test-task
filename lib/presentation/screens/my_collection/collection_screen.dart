import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/collection/collection_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/collection/collection_event.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/collection/collection_state.dart';

class ItemGridScreen extends StatelessWidget {
  const ItemGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationBloc, PaginationState>(
      builder: (context, state) {
        if (state is PaginationLoading && state is! PaginationLoaded) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PaginationLoaded) {
          final items = state.items;

          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
                  !state.hasReachedMax) {
                context.read<PaginationBloc>().add(FetchItemsEvent());
              }
              return false;
            },
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.asset('assets/images/img_bottle.png', width: 80,
                        height: 80,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          items[index].name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is PaginationError) {
          return const Center(child: Text('Error loading items'));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
