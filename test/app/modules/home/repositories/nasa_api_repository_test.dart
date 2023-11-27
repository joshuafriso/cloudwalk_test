import 'package:cloudwalk_test/app/modules/home/services/dio_client.dart';
import 'package:cloudwalk_test/app/shared/models/nasa_apod_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nasa_api_repository_test.mocks.dart';

@GenerateMocks([DioClient])
void main() {
  late DioClient dioClient;

  setUp(() {
    dioClient = MockDioClient();
  });

  group("group test nasa api repository", () {
    test("returns a List<NasaApodModel> if the request completes successfully",
        () async {
      Map<String, dynamic>? queryParameters = {
        'api_key': const String.fromEnvironment('APIKEY'),
        'start_date': DateTime.now()
      };
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

      when(dioClient.get(queryParameters))
          .thenAnswer((realInvocation) async => defaultAnswer);
      expect(await dioClient.get(queryParameters), isA<List<NasaApodModel>>());
    });

    test("throws an exception if request completes with an error", () async {
      Map<String, dynamic>? queryParameters = {};
      when(dioClient.get(queryParameters)).thenThrow(Exception());
      expect(() async => await dioClient.get(queryParameters), throwsException);
    });
  });
}
