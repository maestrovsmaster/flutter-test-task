import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';

class LocalCollectionRepository {
  final Box<List<dynamic>> cacheBox;
  final Box<ItemModel> itemBox;

  final Box<List<String>> collectionBox;

  LocalCollectionRepository({required this.cacheBox, required this.itemBox, required this.collectionBox});

  Future<void> saveAllItems(List<ItemModel> items) async {
    final jsonList = items.map((item) => item.toJson()).toList();
    await cacheBox.put('all_items', jsonList);
  }


  List<ItemModel> getItems({required int page, required int limit}) {
    final jsonList = cacheBox.get('all_items', defaultValue: []);

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

  ItemModel? getItemFromCache(String itemId) {
    return itemBox.get(itemId);
  }

  Future<void> saveItemToCache(String itemId, ItemModel item) async {
    try {
      await itemBox.put(itemId, item);
    }catch(e){
      if(kDebugMode) {
        debugPrint("Error saving item to cache: $e");
      }
    }
  }

  bool hasCachedItems() {
    return cacheBox.containsKey('all_items');
  }


  /// Save Item to collection
  Future<void> addItemToCollection(String itemId) async {
    final List<String> currentItems = collectionBox.get('collection', defaultValue: [])!;
    if (!currentItems.contains(itemId)) {
      currentItems.add(itemId);
      await collectionBox.put('collection', currentItems);
    }
  }

  /// Remove Item from collection
  Future<void> removeItemFromCollection(String itemId) async {
    final List<String> currentItems = collectionBox.get('collection', defaultValue: [])!;
    if (currentItems.contains(itemId)) {
      currentItems.remove(itemId);
      await collectionBox.put('collection', currentItems);
    }
  }

  /// Check if item is added to collection
  bool isItemAddedToCollection(String itemId) {
    final List<String> currentItems = collectionBox.get('collection', defaultValue: [])!;
    return currentItems.contains(itemId);
  }


}
