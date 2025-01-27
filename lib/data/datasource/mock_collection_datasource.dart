import '../models/item_model.dart';
import 'mock_item_generator.dart';

abstract class CollectionDataSource {
  Future<List<ItemModel>> fetchItems({required int page, required int limit});
}

class MockCollectionDataSource implements CollectionDataSource {
  static const int maxMockItems = 200; //Mock limit of server items

  @override
  Future<List<ItemModel>> fetchItems(
      {required int page, required int limit}) async {
    await Future.delayed(
        const Duration(milliseconds: 400)); //Mock server response time

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
            'id_$itemIndex', 'Springbank 1992 #$itemIndex', 1992);
      },
    );
  }
}
