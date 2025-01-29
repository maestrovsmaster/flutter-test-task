import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:pixelfield_flutter_task/data/datasource/mock_collection_datasource.dart';
import 'package:pixelfield_flutter_task/data/datasource/mock_from_assets_collection_data_source.dart';
import 'package:pixelfield_flutter_task/data/datasource/mock_from_generator_collection_data_source.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/domain/repositories/collection_repository.dart';
import 'package:pixelfield_flutter_task/domain/repositories/local_collection_repository.dart';
import 'package:pixelfield_flutter_task/domain/repositories/sign_in_repository.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/auth/auth_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/collections_list/collection_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/collections_list/collection_event.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/main_screen/main_screen_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/sign_in/sign_in_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/welcome/welcome_block.dart';

final sl = GetIt.instance;

/// Initialize the dependency injection container.
/// assets - mock data from assets
/// generator - mock data from generator
Future<void> init({String mockType = 'assets'}) async {
  final itemBox = await Hive.openBox<ItemModel>('item_model_box');
  sl.registerLazySingleton<Box<ItemModel>>(() => itemBox);

  sl.registerLazySingleton(() => AuthBloc());

  sl.registerLazySingleton(() => SignInRepository());

  CollectionDataSource dataSource = mockType == 'assets'
      ? MockFromAssetsCollectionDataSource()
      : MockFromGeneratorCollectionDataSource();

  sl.registerLazySingleton<CollectionDataSource>(() => dataSource);

  final cacheBox = await Hive.openBox<List<dynamic>>('collection_cache');
  sl.registerLazySingleton<Box<List<dynamic>>>(() => cacheBox);

  sl.registerLazySingleton(
      () => LocalCollectionRepository(cacheBox: cacheBox, itemBox: itemBox));
  sl.registerLazySingleton<CollectionRepository>(
      () => CollectionRepositoryImpl(dataSource: sl()));

  // Register Connectivity
  sl.registerLazySingleton(() => Connectivity());

  //Collection list block
  sl.registerFactory(() {
    final bloc = CollectionBloc(
      repository: sl(),
      localRepository: sl(),
      connectivity: sl(),
    );
    bloc.add(FetchItemsEvent());
    return bloc;
  });

  //Details block
  sl.registerFactory(() {
    final bloc = BottleDetailsBloc(
      repository: sl(),
      localRepository: sl(),
      connectivity: sl(),
    );
    return bloc;
  });

  sl.registerFactory(() => WelcomeBloc(repository: sl<SignInRepository>()));

  sl.registerFactory(() => SignInBloc(repository: sl<SignInRepository>()));

  sl.registerFactory(() => MainScreenBloc(repository: sl<SignInRepository>()));
}
