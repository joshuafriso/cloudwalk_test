import 'package:cloudwalk_test/app/config/app_endpoints.dart';
import 'package:cloudwalk_test/app/config/dio_config.dart';
import 'package:cloudwalk_test/app/modules/home/interfaces/ihttp_client.dart';

class DioClient implements IHttpClient {
  @override
  get(Map<String, dynamic>? queryParameters) {
    return dio.get(AppEndpoints.nasaApiPath, queryParameters: queryParameters);
  }
}
