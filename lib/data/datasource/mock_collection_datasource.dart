import '../models/item_model.dart';
import '../mock/generator/mock_item_generator.dart';

abstract class CollectionDataSource {
  Future<List<ItemModel>> fetchItems({required int page, required int limit});

  Future<ItemModel?> fetchItemDetails(String itemId);
}

