import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter_task/core/di/di_container.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_event.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_state.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/animated_checkmark.dart';

import '../../widgets/animated_cancel.dart';
import 'bottle_details_body.dart';
import 'widgets/add_item_widget.dart';
import 'widgets/header.dart';

class BottleDetailsScreen extends StatelessWidget {
  final String itemId;

  const BottleDetailsScreen({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BottleDetailsBloc>(),
      child: BottleDetailsScaffold(itemId: itemId),
    );
  }
}

class BottleDetailsScaffold extends StatelessWidget {
  final String itemId;

  const BottleDetailsScaffold({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBottleDetails,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/img_bottle_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const Header(),
              Expanded(
                child: BottleDetailsBody(itemId: itemId),
              ),
            ],
          ),
          BlocSelector<BottleDetailsBloc, BottleDetailsState, bool>(
              selector: (state) =>
                  state is BottleDetailsLoaded ? state.isAdded : false,
              builder: (context, isAdded) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: IntrinsicWidth(
                        child: AddItemWidget(
                      isAdded: isAdded,
                      onAdded: () {
                        showCheckmark(context);
                        context
                            .read<BottleDetailsBloc>()
                            .add(AddItemToCollectionEvent(itemId: itemId));
                      },
                      onRemoved: () {
                        showCancel(context);
                        context
                            .read<BottleDetailsBloc>()
                            .add(RemoveItemFromCollectionEvent(itemId: itemId));
                      },
                    )),
                  ),
                );
              })
        ],
      ),
    );
  }
}
