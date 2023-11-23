import 'package:cloudwalk_test/app/modules/home/interfaces/ilocal_db_client.dart';
import 'package:cloudwalk_test/app/shared/models/nasa_apod_model.dart';

class NasaDbLocalRepository {
  final ILocalDbClient dbClient;

  NasaDbLocalRepository(this.dbClient);

  addAll(List<NasaApodModel> list) async {
    bool isNotEmpty = await verifyDbIsNotEmpty();
    if (isNotEmpty) {
      await deleteAll();
      await dbClient.addAll(list);
    } else {
      await dbClient.addAll(list);
    }
  }

  deleteAll() async {
    await dbClient.deleteAll();
  }

  Future<List<NasaApodModel>> getList() async {
    return await dbClient.getList();
  }

  Future<bool> verifyDbIsNotEmpty() async {
    return await dbClient.dbIsNotEmpty();
  }
}
