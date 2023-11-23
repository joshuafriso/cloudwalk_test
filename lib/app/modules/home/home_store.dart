import 'package:cloudwalk_test/app/config/app_pages_routes.dart';
import 'package:cloudwalk_test/app/modules/home/repositories/nasa_api_repository.dart';
import 'package:cloudwalk_test/app/modules/home/repositories/nasa_db_local_repository.dart';
import 'package:cloudwalk_test/app/shared/models/nasa_apod_model.dart';
import 'package:cloudwalk_test/app/shared/widgets/connectivity_status/connectivity_status_store.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _repository = Modular.get<NasaApiRepository>();
  final _dbRepository = Modular.get<NasaDbLocalRepository>();
  final connectivity = Modular.get<ConnectivityStatusStore>();

  List<NasaApodModel>? _staticList;

  @observable
  List<NasaApodModel>? apodList;

  @observable
  String searchValue = "";

  @observable
  ObservableFuture<List<NasaApodModel>?> response =
      ObservableFuture.value(null);

  @computed
  bool get isLoadingData => response.status == FutureStatus.pending;

  @action
  void getApiData() {
    var today = DateTime.now();
    var formatter = DateFormat("yyyy-MM-dd");
    var startDate = formatter.format(today.subtract(const Duration(days: 30)));
    response = _repository.getApodList(startDate.toString()).asObservable();
  }

  @action
  void getLocalData() {
    response = _dbRepository.getList().asObservable();
  }

  @action
  void changeList() {
    List<NasaApodModel>? values = response.value;
    values!.sort((a, b) => b.date!.compareTo(a.date!));
    apodList = values;
    _staticList = apodList;
    _dbRepository.addAll(apodList!);
  }

  @action
  void changeSearchValue(String value) {
    searchValue = value;
  }

  List<ReactionDisposer> _disposers = [];

  void setupReactions() {
    _disposers = [
      reaction((_) => searchValue, filterApodList),
      reaction((_) => connectivity.checkConnectivity.value, (result) {
        if (result == ConnectivityResult.none) {
          getLocalData();
        } else {
          getApiData();
        }
      }),
      reaction((_) => response.status, (result) {
        if (result == FutureStatus.fulfilled) {
          changeList();
        }
      })
    ];
  }

  @action
  void filterApodList(String value) {
    List<NasaApodModel>? result = [];
    if (value.isEmpty) {
      result = _staticList;
    } else if (value.startsWith(RegExp(r'[a-z]'), 0)) {
      result = _staticList!
          .where((element) =>
              (element.title!.toLowerCase().contains(value.toLowerCase())))
          .toList();
    } else {
      result = _staticList!
          .where((element) => element.date!.contains(value))
          .toList();
    }
    apodList = result;
  }

  void goToDetails(NasaApodModel model) {
    Modular.to.pushNamed(AppPagesRoutes.details, arguments: model);
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
