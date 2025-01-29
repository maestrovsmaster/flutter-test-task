import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/data/models/tasting_notes.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/tabs/tasting_notes/tasting_widgets.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/video_placeholder.dart';

class NotesToggleCubit extends Cubit<bool> {
  NotesToggleCubit() : super(false);

  void toggle() {
    emit(!state);
  }
}

class TabTastingNotesWidget extends StatelessWidget {
  final GlobalKey _notesKey;

  final ItemModel item;
  final ScrollController scrollController;

  TabTastingNotesWidget({
    super.key,
    required this.item,
    required this.scrollController,
  }) : _notesKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TastingNotes? officialNotes = item.officialNotes;
    TastingNotes? userNotes = item.userNotes;

    return BlocProvider(
      create: (_) => NotesToggleCubit(),
      child: BlocBuilder<NotesToggleCubit, bool>(
        builder: (context, isExpanded) {
          if (isExpanded) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollToBottom(context);
            });
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollToUp();
            });
          }

          return Container(
              color: AppColors.cardBackground,
              child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Video Player Placeholder like YoutubePlayer
                      if(item.videoUrl != null)
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          color: Colors.grey[800],
                          child: LazyYouTubePlayer(videoUrl: item.videoUrl!,),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Tasting Notes Header
                      Text('Tasting notes',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 4),
                      Text(translate('by_charles_mac_lean'),
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.secondaryText2,
                                  )),
                      const SizedBox(height: 16),

                      // Official Notes
                      if (officialNotes != null) ...[
                        buildTastingNotesSection( context,
                            translate('nose'), officialNotes.nose ?? ''),
                        const SizedBox(height: 8),
                        buildTastingNotesSection(context,
                            translate('palate'), officialNotes.palate ?? ''),
                        const SizedBox(height: 8),
                        buildTastingNotesSection(context,
                            translate('finish'), officialNotes.finish ?? ''),
                      ],
                      const SizedBox(height: 32),

                      Row(
                        children: [
                          Text(
                            translate('your_notes'),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              context.read<NotesToggleCubit>().toggle();
                            },
                            icon: AnimatedRotation(
                              turns: isExpanded ? 0.5 : 0,
                              duration: const Duration(milliseconds: 300),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18,),
                      // User Notes
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: isExpanded && userNotes != null
                            ? Column(
                                key: _notesKey,
                                children: [
                                  buildTastingNotesSection(context,
                                      translate('nose'), userNotes.nose ?? ''),
                                  const SizedBox(height: 8),
                                  buildTastingNotesSection(context,
                                      'Palate', translate('palate')),
                                  const SizedBox(height: 8),
                                  buildTastingNotesSection(context,
                                      translate('finish'), userNotes.finish ?? ''),
                                ],
                              )
                            : const SizedBox.shrink(key: ValueKey('empty')),
                      ),
                    ],
                  )));
        },
      ),
    );
  }

  void _scrollToBottom(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderObject = context.findRenderObject() as RenderBox?;
      if (renderObject != null) {
        final position = renderObject.localToGlobal(Offset.zero);
        final offset = scrollController.offset + position.dy +200;

        scrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _scrollToUp() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderObject =
          _notesKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderObject != null) {
        final blockHeight = renderObject.size.height;

        scrollController.animateTo(
          scrollController.offset - blockHeight ,//+ 50,
          // 50 is the height of previous 'Your notes' title
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
