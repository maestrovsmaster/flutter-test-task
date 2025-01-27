import 'package:flutter/material.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';

class TabDetailsWidget extends StatelessWidget {
  final ItemModel item;

  const TabDetailsWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> itemDetails = {
      'Distillery': item.distillery ?? '',
      'Region': item.region ?? '',
      'Country': item.country ?? '',
      'Type': item.type ?? '',
      'Age Statement': item.ageStatement ?? '',
      'Filled': item.filled ?? '',
      'Bottled': item.bottled ?? '',
      'Cask Number': item.caskNumber ?? '',
      'ABV': item.abv ?? '',
      'Size': item.size ?? '',
      'Finish': item.finish ?? '',
    };

    return Container(
      color: AppColors.cardBackground,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: itemDetails.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  entry.key,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Flexible(
                  child: Text(
                    entry.value.toString(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryText2,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
