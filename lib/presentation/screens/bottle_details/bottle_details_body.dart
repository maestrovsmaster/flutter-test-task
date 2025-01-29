import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_event.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_state.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/bottle_details_content.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/error_with_refresh_widget.dart';

class BottleDetailsBody extends StatelessWidget {
  final String itemId;

  const BottleDetailsBody({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottleDetailsBloc, BottleDetailsState>(
      builder: (context, state) {
        if (state is BottleDetailsInitial && state is! BottleDetailsLoading) {
          context.read<BottleDetailsBloc>().add(FetchBottleDetailsEvent(itemId));
          return const Center(
            child: CircularProgressIndicator(color: AppColors.accentColor),
          );
        } else if (state is BottleDetailsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.accentColor),
          );
        } else if (state is BottleDetailsError) {
          return ErrorWithRefreshWidget(
            errorMessage: state.errorMessage,
            onRefresh: () {
              context.read<BottleDetailsBloc>().add(FetchBottleDetailsEvent(itemId));
            },
          );
        } else if (state is BottleDetailsLoaded) {
          return BottleDetailsContent(item: state.item);
        } else {
          return const Placeholder();
        }
      },
    );
  }
}