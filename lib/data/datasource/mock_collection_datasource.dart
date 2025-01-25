import '../models/item_model.dart';

abstract class CollectionDataSource {
  Future<List<ItemModel>> fetchItems({required int page, required int limit});
}

class MockCollectionDataSource implements CollectionDataSource {
  @override
  Future<List<ItemModel>> fetchItems({required int page, required int limit}) async {
    await Future.delayed(const Duration(microseconds: 300));

    return List.generate(
      limit,
          (index) {
        final itemIndex = (page - 1) * limit + index;
        return ItemModel(
          id: 'id_$itemIndex',
          name: 'Springbank 1992 #$itemIndex',
          imageUrl: 'https://via.placeholder.com/150',
          count: 112,
          total: 158,
        );
      },
    );
  }
}

