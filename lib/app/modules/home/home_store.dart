import 'package:cloudwalk_test/app/modules/home/repositories/nasa_api_repository.dart';
import 'package:cloudwalk_test/app/modules/home/services/dio_client.dart';
import 'package:cloudwalk_test/app/shared/models/nasa_apod_model.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final NasaApiRepository _repository = NasaApiRepository(DioClient());
  @observable
  bool isLoading = false;

  @observable
  List<NasaApodModel>? apodList;

  @observable
  ObservableFuture<List<NasaApodModel>?> response =
      ObservableFuture.value(null);

  @action
  void getData() {
    var today = DateTime.now();
    var formatter = DateFormat("yyyy-MM-dd");
    var startDate = formatter.format(today.subtract(const Duration(days: 30)));
    response = _repository
        .getApodList(startDate.toString())
        .asObservable()
        .then((value) {
      value!.sort((a, b) => b.date!.compareTo(a.date!));
      apodList = value;
      return apodList;
    });
  }
}
