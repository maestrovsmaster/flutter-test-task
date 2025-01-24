import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register BLoC
  // sl.registerFactory(() => MyBloc(repository: sl()));

  // Register UseCases
  // sl.registerLazySingleton(() => GetItemsUseCase(repository: sl()));

  // Register Repositories
  // sl.registerLazySingleton<MyRepository>(() => MyRepositoryImpl(dataSource: sl()));

  // Register Data Sources
  // sl.registerLazySingleton<MyDataSource>(() => MyDataSourceImpl());

  // Additional core services can be added here
}
