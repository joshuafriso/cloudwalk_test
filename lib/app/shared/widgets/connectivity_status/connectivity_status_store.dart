import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_status_store.g.dart';

class ConnectivityStatusStore = ConnectivityStatusStoreBase
    with _$ConnectivityStatusStore;

abstract class ConnectivityStatusStoreBase with Store {
  final Connectivity _connectivity;
  @observable
  ObservableStream<ConnectivityResult> connectivityStream =
      ObservableStream(Connectivity().onConnectivityChanged);

  @observable
  ObservableFuture<ConnectivityResult> checkConnectivity =
      ObservableFuture.value(ConnectivityResult.mobile);

  @observable
  bool noSignal = false;

  ConnectivityStatusStoreBase({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity();

  @action
  void changeStatus(bool value) {
    noSignal = value;
  }

  @action
  void checkConnectivityStatus() {
    checkConnectivity = _connectivity.checkConnectivity().asObservable();
  }

  void dispose() {}
}
