import 'package:pixelfield_flutter_task/data/datasource/mock_collection_datasource.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';


abstract class CollectionRepository {
  Future<List<ItemModel>> getItems({required int page, required int limit});
}

class CollectionRepositoryImpl implements CollectionRepository {
  final CollectionDataSource dataSource;

  CollectionRepositoryImpl({required this.dataSource});

  @override
  Future<List<ItemModel>> getItems({required int page, required int limit}) {
    print("'ONLINE REQUEST' CollectionRepository getItems ");
    return dataSource.fetchItems(page: page, limit: limit);
  }
}