import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:pixelfield_flutter_task/core/utils/connectivity_utils.dart';
import 'package:pixelfield_flutter_task/data/mock/generator/mock_item_generator.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/domain/repositories/collection_repository.dart';
import 'package:pixelfield_flutter_task/domain/repositories/local_collection_repository.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_event.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/bottle_details/bottle_details_state.dart';

import 'package:mocktail/mocktail.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// Mock classes
class MockCollectionRepository extends Mock implements CollectionRepository {}

class MockLocalCollectionRepository extends Mock
    implements LocalCollectionRepository {}

class MockConnectivity extends Mock implements Connectivity {}

class FakeItemModel extends Fake implements ItemModel {}

void main() {
  late BottleDetailsBloc bloc;
  late MockCollectionRepository mockRepository;
  late MockLocalCollectionRepository mockLocalRepository;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockRepository = MockCollectionRepository();
    mockLocalRepository = MockLocalCollectionRepository();
    mockConnectivity = MockConnectivity();
    registerFallbackValue(FakeItemModel());

    bloc = BottleDetailsBloc(
      repository: mockRepository,
      localRepository: mockLocalRepository,
      connectivity: mockConnectivity,
    );
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state should be BottleDetailsInitial', () {
    expect(bloc.state, isA<BottleDetailsInitial>());
  });

  blocTest<BottleDetailsBloc, BottleDetailsState>(
    'emits BottleDetailsLoaded when LoadBottleDetailsEvent is added',
    build: () {
      when(() => mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => [ConnectivityResult.wifi]);
      when(() => mockLocalRepository.getItemFromCache(any())).thenReturn(null);
      when(() => mockRepository.fetchItemDetails(any()))
          .thenAnswer((_) async => generateMockItem("123", "Mock Item", 2025));
      when(() => mockLocalRepository.isItemAddedToCollection(any()))
          .thenReturn(false);
      when(() => mockLocalRepository.saveItemToCache(any(), any()))
          .thenAnswer((_) async => Future.value());
      return bloc;
    },
    act: (bloc) => bloc.add(FetchBottleDetailsEvent('123')),
    expect: () => [isA<BottleDetailsLoading>(), isA<BottleDetailsLoaded>()],
  );

  blocTest<BottleDetailsBloc, BottleDetailsState>(
    'SelectBottleEvent updates selectedBottle',
    build: () => bloc,
    seed: () =>
        BottleDetailsLoaded(item: generateMockItem("123", "Mock Item", 2025)),
    act: (bloc) => bloc.add(SelectBottleEvent(value: '123')),
    expect: () => [
      BottleDetailsLoaded(
          item: generateMockItem("123", "Mock Item", 2025),
          selectedBottle: '123')
    ],
  );

  test('hasInternetConnection returns true when connected', () async {
    final mockConnectivity = MockConnectivity();

    when(() => mockConnectivity.checkConnectivity())
        .thenAnswer((_) async => [ConnectivityResult.wifi]);

    final result = await hasInternetConnection(mockConnectivity);

    expect(result, isTrue); // Expect true when connected
  });

  test('hasInternetConnection returns false when not connected', () async {
    final mockConnectivity = MockConnectivity();

    when(() => mockConnectivity.checkConnectivity())
        .thenAnswer((_) async => [ConnectivityResult.none]); // Немає інтернету

    final result = await hasInternetConnection(mockConnectivity);

    expect(result, isFalse); // Expect false when not connected
  });


}
