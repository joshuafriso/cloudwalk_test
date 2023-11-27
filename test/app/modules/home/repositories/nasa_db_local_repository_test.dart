import 'package:cloudwalk_test/app/modules/home/repositories/nasa_db_local_repository.dart';
import 'package:cloudwalk_test/app/modules/home/services/hive_service.dart';
import 'package:cloudwalk_test/app/shared/models/nasa_apod_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nasa_db_local_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<HiveService>()])
void main() {
  late MockHiveService mockLocalDbClient;
  late NasaDbLocalRepository nasaDbLocalRepository;

  setUp(() {
    mockLocalDbClient = MockHiveService();
    nasaDbLocalRepository = NasaDbLocalRepository(mockLocalDbClient);
  });

  group('NasaDbLocalRepository Test', () {
    final defaultAnswer = [
      NasaApodModel(
        date: '2021-09-20',
        explanation: 'Explanation',
        imgHdUrl: 'https://apod.nasa.gov/apod/img.jpg',
        mediaType: 'image',
        title: 'Title',
        imgUrl: 'https://apod.nasa.gov/apod/image.jog',
      ),
    ];

    test('should return list of NasaApodModel from getList', () async {
      when(mockLocalDbClient.getList()).thenAnswer((_) async => defaultAnswer);

      final result = await nasaDbLocalRepository.getList();

      expect(result, defaultAnswer);
    });

    test('should call addAll method of local db client', () async {
      when(mockLocalDbClient.dbIsNotEmpty()).thenAnswer((_) async => true);
      await nasaDbLocalRepository.verifyDbIsNotEmpty();

      await nasaDbLocalRepository.addAll(defaultAnswer);

      verify(mockLocalDbClient.addAll(defaultAnswer));
    });

    test('should call deleteAll method of local db client', () async {
      await nasaDbLocalRepository.deleteAll();

      verify(mockLocalDbClient.deleteAll());
    });
  });
}
