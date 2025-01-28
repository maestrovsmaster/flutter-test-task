import 'package:flutter/cupertino.dart';
import 'package:pixelfield_flutter_task/data/mock/assets/mock_items_from_json.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';

import 'mock_collection_datasource.dart';

class MockFromAssetsCollectionDataSource implements CollectionDataSource {
  static const int maxMockItems = 200; //Mock limit of server items

  @override
  Future<List<ItemModel>> fetchItems(
      {required int page, required int limit}) async {
    await Future.delayed(
        const Duration(milliseconds: 300)); //Mock server response time

    List<dynamic> jsonData = await loadMockDataList("collections.json");

    final items = (jsonData)
        .map((json) => ItemModel.fromJson(json as Map<String, dynamic>))
        .toList();

    final startIndex = (page - 1) * limit;
    final endIndex = startIndex + limit;

    if (startIndex >= items.length) {
      return [];
    }

    final safeEndIndex = endIndex > items.length ? items.length : endIndex;

    return items.sublist(startIndex, safeEndIndex);
  }

  @override
  Future<ItemModel?> fetchItemDetails(String itemId) async {
    try {
      final Map<String, dynamic> jsonData =
          await loadMockDataItem("collection_details.json");

      if (jsonData.isEmpty) {
        debugPrint("Item with ID $itemId not found in mock data.");
        return null;
      }
      return ItemModel.fromJson(jsonData);
    } catch (e) {
      debugPrint("Error loading item details: $e");
      return null;
    }
  }
}
