import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:pixelfield_flutter_task/data/datasource/mock_collection_datasource.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/domain/repositories/collection_repository.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/collection/collection_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/collection/collection_event.dart';

final sl = GetIt.instance;

Future<void> init() async {

  final itemBox = await Hive.openBox<ItemModel>('item_model_box');
  sl.registerLazySingleton<Box<ItemModel>>(() => itemBox);

  sl.registerLazySingleton<CollectionDataSource>(() => MockCollectionDataSource());

  final cacheBox = await Hive.openBox('pagination_cache');
  sl.registerLazySingleton(() => cacheBox);

  sl.registerLazySingleton<CollectionRepository>(
          () => CollectionRepositoryImpl(dataSource: sl()));

  // Register Connectivity
  sl.registerLazySingleton(() => Connectivity());

  //Collection block
  sl.registerFactory(() {
    final bloc = PaginationBloc(
      repository: sl(),
      cacheBox: sl(),
      connectivity: sl(),
    );
    bloc.add(FetchItemsEvent());
    return bloc;
  });

}
