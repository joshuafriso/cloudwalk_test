import 'package:cloudwalk_test/app/modules/home/interfaces/ihttp_client.dart';
import 'package:cloudwalk_test/app/shared/models/nasa_apod_model.dart';

class NasaApiRepository {
  final IHttpClient client;

  NasaApiRepository(this.client);

  Future<List<NasaApodModel>?> getApodList(String startDate) async {
    Map<String, dynamic>? queryParameters = {
      'api_key': const String.fromEnvironment('APIKEY'),
      'start_date': startDate
    };

    try {
      final response = await client.get(queryParameters);

      List<NasaApodModel>? apodList = NasaApodModel.fromJsonList(response.data);

      return apodList;
    } catch (e) {
      throw Exception();
    }
  }
}
