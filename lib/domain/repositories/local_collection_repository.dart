import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';

class LocalCollectionRepository {
  final Box<List<dynamic>> cacheBox;

  LocalCollectionRepository({required this.cacheBox});

  Future<void> saveAllItems(List<ItemModel> items) async {
    final jsonList = items.map((item) => item.toJson()).toList();
    await cacheBox.put('all_items', jsonList);
  }


  List<ItemModel> getItems({required int page, required int limit}) {
    final jsonList = cacheBox.get('all_items', defaultValue: []);

    debugPrint("'OFFLINE CACHE' LocalCollectionRepository getItems ");

    final allItems = (jsonList as List)
        .map((json) => ItemModel.fromJson(Map<String, dynamic>.from(json as Map)))
        .toList();


    final startIndex = (page - 1) * limit;
    final endIndex = startIndex + limit;

    if (startIndex >= allItems.length) {
      return [];
    }

    final safeEndIndex = endIndex > allItems.length ? allItems.length : endIndex;


    return allItems.sublist(startIndex, safeEndIndex);
  }



  bool hasCachedItems() {
    return cacheBox.containsKey('all_items');
  }
}
