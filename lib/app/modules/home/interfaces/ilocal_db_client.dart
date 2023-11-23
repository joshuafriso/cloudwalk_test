import 'package:cloudwalk_test/app/shared/models/nasa_apod_model.dart';

abstract class ILocalDbClient {
  getList();
  addAll(List<NasaApodModel> list);
  deleteAll();
  dbIsNotEmpty();
}
