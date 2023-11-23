import 'package:cloudwalk_test/app/modules/home/interfaces/ilocal_db_client.dart';
import 'package:cloudwalk_test/app/shared/models/nasa_apod_model.dart';
import 'package:hive/hive.dart';

class HiveService implements ILocalDbClient {
  Future<Box> _initBoxUser() async {
    Box box;
    try {
      box = Hive.box<NasaApodModel>('user');
    } catch (e) {
      box = await Hive.openBox<NasaApodModel>('user');
    }
    return box;
  }

  @override
  addAll(List<NasaApodModel> list) async {
    Box box = await _initBoxUser();
    if (box.isEmpty) {
      box.addAll(list);
    } else {
      for (var item in list) {
        if (!await existsByDate(item.date!)) {
          box.add(item);
        }
      }
    }
  }

  @override
  deleteAll() async {
    Box box = await _initBoxUser();
    if (box.length > 0) {
      box.deleteAll(box.keys);
    }
  }

  @override
  getList() async {
    Box box = await _initBoxUser();
    List<NasaApodModel> listApod = <NasaApodModel>[];
    if (box.length > 0) {
      for (var i = 0; i < box.length; i++) {
        listApod.add(box.getAt(i));
      }
    }
    return listApod;
  }

  @override
  dbIsNotEmpty() async {
    Box box = await _initBoxUser();
    return box.length > 0;
  }

  existsByDate(String date) async {
    Box box = await _initBoxUser();
    return box.values.contains(date);
  }
}
