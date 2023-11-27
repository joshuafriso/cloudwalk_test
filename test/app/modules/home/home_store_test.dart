import 'package:cloudwalk_test/app/modules/home/home_module.dart';
import 'package:cloudwalk_test/app/modules/home/home_store.dart';
import 'package:cloudwalk_test/app/modules/home/repositories/nasa_api_repository.dart';
import 'package:cloudwalk_test/app/modules/home/repositories/nasa_db_local_repository.dart';
import 'package:cloudwalk_test/app/modules/home/services/dio_client.dart';
import 'package:cloudwalk_test/app/shared/models/nasa_apod_model.dart';
import 'package:cloudwalk_test/app/shared/widgets/connectivity_status/connectivity_status_store.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart' as mock;

import 'home_store_test.mocks.dart';

@GenerateMocks([Connectivity, DioClient])
@GenerateNiceMocks(
    [MockSpec<NasaApiRepository>(), MockSpec<NasaDbLocalRepository>()])
void main() {
  group('HomeStore', () {
    late HomeStore store;
    final MockNasaApiRepository mockApiRepository = MockNasaApiRepository();
    final MockNasaDbLocalRepository mockDbRepository =
        MockNasaDbLocalRepository();
    final MockConnectivity mockConnectivity = MockConnectivity();
    final ConnectivityStatusStore connectivityStatusStore =
        ConnectivityStatusStore(connectivity: mockConnectivity);
    Modular.bindModule(HomeModule());
    Modular.replaceInstance<ConnectivityStatusStore>(connectivityStatusStore);
    Modular.replaceInstance<NasaApiRepository>(mockApiRepository);
    Modular.replaceInstance<NasaDbLocalRepository>(mockDbRepository);

    final defaultAnswer = <NasaApodModel>[
      NasaApodModel(
        date: '2021-09-20',
        explanation: 'Explanation',
        imgHdUrl: 'https://apod.nasa.gov/apod/img.jpg',
        mediaType: 'image',
        title: 'Title',
        imgUrl: 'https://apod.nasa.gov/apod/image.jog',
      ),
      NasaApodModel(
        date: '2021-09-22',
        explanation: 'Explanation2',
        imgHdUrl: 'https://apod.nasa.gov/apod/img2.jpg',
        mediaType: 'image',
        title: 'Title2',
        imgUrl: 'https://apod.nasa.gov/apod/image2.jog',
      ),
    ];

    setUp(() {
      store = Modular.get<HomeStore>();
      mock.when(mockConnectivity.checkConnectivity()).thenAnswer(
            (_) => ObservableFuture.value(ConnectivityResult.mobile),
          );

      store.setupReactions();
    });

    tearDown(() {
      mock.reset(mockConnectivity);
      mock.reset(mockDbRepository);
      mock.reset(mockApiRepository);
      store.dispose();
    });

    test('initial values', () {
      expect(store.apodList, isNull);
      expect(store.searchValue, "");
      expect(store.response.status, FutureStatus.fulfilled);
    });

    test('getApiData', () async {
      var startDate = "2023-11-25";
      mock
          .when(mockApiRepository.getApodList(startDate))
          .thenAnswer((_) async => defaultAnswer);
      store.getApiData();
      mock.verify(mockApiRepository.getApodList(mock.any)).called(1);
      expect(store.response.status, FutureStatus.pending);
    });

    test('getLocalData', () async {
      mock
          .when(mockDbRepository.getList())
          .thenAnswer((_) async => defaultAnswer);
      store.getLocalData();
      mock.verify(mockDbRepository.getList()).called(1);
      expect(store.response.status, FutureStatus.pending);
    });

    test('changeList', () {
      store.response = ObservableFuture.value([
        NasaApodModel(date: '2023-01-01', title: 'Test B'),
        NasaApodModel(date: '2023-02-02', title: 'Test A'),
      ]);

      store.changeList();

      expect(store.apodList!.length, 2);
      expect(store.apodList![0].title, 'Test A');
      expect(store.apodList![1].title, 'Test B');

      mock.verify(mockDbRepository.addAll(store.apodList!)).called(1);
    });

    test('changeSearchValue', () {
      store.changeSearchValue("test");
      expect(store.searchValue, "test");
    });

    test('reaction when connectivity changes to none', () async {
      mock
          .when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);

      connectivityStatusStore.checkConnectivityStatus();

      await connectivityStatusStore.checkConnectivity;

      mock
          .when(mockDbRepository.getList())
          .thenAnswer((_) async => defaultAnswer);
      store.setupReactions();
      mock.verify(mockDbRepository.getList()).called(1);

      expect(store.response.status, FutureStatus.pending);
    });

    test('reaction when connectivity changes to mobile', () async {
      mock
          .when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.mobile);

      connectivityStatusStore.checkConnectivityStatus();

      await connectivityStatusStore.checkConnectivity;
      var startDate = "2023-11-25";
      mock
          .when(mockApiRepository.getApodList(startDate))
          .thenAnswer((_) async => defaultAnswer);

      store.setupReactions();

      expect(store.response.status, FutureStatus.pending);
    });

    test('filterApodList', () {
      store.apodList = [
        NasaApodModel(date: '2023-01-01', title: 'Test A'),
        NasaApodModel(date: '2023-01-02', title: 'Test B'),
      ];
      store.populateStaticList(store.apodList);

      store.filterApodList("A");

      expect(store.apodList!.length, 1);
      expect(store.apodList![0].title, 'Test A');
    });
  });
}
