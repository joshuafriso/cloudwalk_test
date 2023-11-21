import 'package:cloudwalk_test/app/config/app_endpoints.dart';
import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(baseUrl: 'https://${AppEndpoints.nasaApi}'));
