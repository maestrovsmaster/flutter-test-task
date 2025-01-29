import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/core/utils/utils.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';

class ItemTitleDelegate extends SliverPersistentHeaderDelegate {
  final ItemModel item;

  final double height = 136;

  ItemTitleDelegate({
    required this.item,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bottlesText = item.count != null
        ? translate('bottle', args: {
            'number': item.count.toString(),
            'total': item.total != null ? item.total.toString() : ''
          })
        : "";

    final title = "${item.name}   ";
    final vineAge = item.year != null
        ? translate('year_old',
            args: {'age': calculateItemAge(item.year!).toString()})
        : "";
    final batchNumber = item.batchNumber != null ? "#${item.batchNumber}" : "";
    return SizedBox(
        width: double.infinity,
        height: height,
        child: Container(
          color: AppColors.cardBackground,
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bottlesText,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryText2,
                    ),
              ),
              SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: title,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                  )),
                          TextSpan(
                            text: vineAge,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                  color: AppColors.accentColor,
                                ),
                          ),
                        ],
                      ),
                      maxLines: 1,
                      minFontSize: 8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
              SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: AutoSizeText(
                    batchNumber,
                    style: Theme.of(context).textTheme.displayLarge,
                    maxLines: 2,
                    minFontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ))
            ],
          ),
        ));
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
