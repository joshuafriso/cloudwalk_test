import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_status_store.g.dart';

class ConnectivityStatusStore = ConnectivityStatusStoreBase
    with _$ConnectivityStatusStore;

abstract class ConnectivityStatusStoreBase with Store {
  @observable
  ObservableStream<ConnectivityResult> connectivityStream =
      ObservableStream(Connectivity().onConnectivityChanged);

  @observable
  bool status = false;

  @action
  void changeStatus(bool value) {
    status = value;
  }

  void dispose() {}
}
