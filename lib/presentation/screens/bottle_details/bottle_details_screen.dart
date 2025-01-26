import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_state.dart';

class BottleDetailsScreen extends StatelessWidget {
  final ItemModel item;

  const BottleDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottleDetailsBloc(),
      child: BottleDetailsContent(item: item),
    );
  }
}

class BottleDetailsContent extends StatefulWidget {
  final ItemModel item;

  const BottleDetailsContent({super.key, required this.item});

  @override
  _BottleDetailsContentState createState() => _BottleDetailsContentState();
}

class _BottleDetailsContentState extends State<BottleDetailsContent> {
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
    final position = _scrollController.position.pixels;
    context.read<BottleDetailsBloc>().scrollUpdated(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 72,
            backgroundColor: Colors.black,
            leading: Icon(Icons.arrow_back, color: Colors.white),
            title: Text('Genesis Collection', style: TextStyle(color: Colors.white)),
            actions: [
              IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<BottleDetailsBloc, BottleDetailsState>(
              builder: (context, state) {
                double opacity = 1.0; // Default opacity
                if (state is BottleDetailsScrolling) {
                  opacity = (1 - state.scrollPosition / 100).clamp(0.0, 1.0);
                }

                return Opacity(
                  opacity: opacity,
                  child: Container(
                    height: 100,
                    color: Colors.orange,
                    alignment: Alignment.center,
                    child: Text(
                      'Genuine Bottle (Unopened)',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text('Bottle Image Placeholder',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 600,
              color: Colors.green,
              alignment: Alignment.center,
              child: Text('Details, Tasting Notes, History Placeholder',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
