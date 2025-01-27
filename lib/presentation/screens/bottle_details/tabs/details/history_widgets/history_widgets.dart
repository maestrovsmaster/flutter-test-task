import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/core/utils/utils.dart';
import 'package:pixelfield_flutter_task/data/models/history_event.dart';

Widget buildEventDescriptionWidget(BuildContext context, HistoryEvent event) {
  String label;
  try {
    label = event.dateTime != null
        ? formatDateToEnglishString(event.dateTime!)
        : '';
  } catch (e) {
    label = '';
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.primaryText,
            ),
      ),
      const SizedBox(height: 8),
      Text(
        event.title ?? '',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      const SizedBox(height: 8),
      Text(
        event.description ?? '',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      const SizedBox(height: 8),
      if (event.attachments != null && event.attachments!.isNotEmpty)
        buildAttachmentsWidget(context, event.attachments!)
    ],
  );
}

Widget buildAttachmentsWidget(BuildContext context, List<String> attachments) {
  return Container(
      color: AppColors.backgroundBottleDetails,
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/ic_clip.svg',
                    height: 12,
                    width: 10.5,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Attachments',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.primaryText,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: attachments.map((attachment) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      width: 64,
                      height: 64,
                      color: const Color(0xFFD9D9D9),
                      child: const Center(
                        child: Icon(
                          Icons.attach_file,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          )));
}
