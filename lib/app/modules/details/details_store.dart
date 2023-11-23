import 'package:cloudwalk_test/app/shared/widgets/connectivity_status/connectivity_status_store.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'details_store.g.dart';

class DetailsStore = DetailsStoreBase with _$DetailsStore;

abstract class DetailsStoreBase with Store {
  final connectivity = Modular.get<ConnectivityStatusStore>();

  @observable
  bool hasSignal = true;

  @action
  void changeStatusSignal(bool value) {
    hasSignal = value;
  }

  List<ReactionDisposer> _disposers = [];

  void setupReactions() {
    _disposers = [
      reaction((_) => connectivity.checkConnectivity.value, (result) {
        if (result == ConnectivityResult.none) {
          changeStatusSignal(false);
        } else {
          changeStatusSignal(true);
        }
      }),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
