import 'package:pixelfield_flutter_task/data/mock/generator/mock_item_generator.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';

import 'mock_collection_datasource.dart';

class MockFromGeneratorCollectionDataSource implements CollectionDataSource {
  static const int maxMockItems = 200; //Mock limit of server items

  @override
  Future<List<ItemModel>> fetchItems(
      {required int page, required int limit}) async {
    await Future.delayed(
        const Duration(milliseconds: 300)); //Mock server response time

    const totalItems = maxMockItems;
    final startIndex = (page - 1) * limit;
    final endIndex = startIndex + limit;

    if (startIndex >= totalItems) {
      return [];
    }

    final safeEndIndex = endIndex > totalItems ? totalItems : endIndex;

    return List.generate(
      safeEndIndex - startIndex,
          (index) {
        final itemIndex = startIndex + index;
        return generateMockItem(
            'id_$itemIndex', 'Whiskey  Bottle 1  Bottle 2', 1994); //Springbank
      },
    );
  }

  @override
  Future<ItemModel?> fetchItemDetails(String itemId) async{
    return generateMockItem(
        itemId, 'Whiskey  Bottle 1  Bottle 2', 1994);
  }
}