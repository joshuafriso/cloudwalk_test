import 'package:cloudwalk_test/app/shared/widgets/connectivity_status/connectivity_status_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(ConnectivityStatusStore.new);
    super.exportedBinds(i);
  }

  @override
  void routes(r) {
    r.module("/", module: HomeModule());
  }
}
