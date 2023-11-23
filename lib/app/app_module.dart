import 'package:cloudwalk_test/app/config/app_pages_routes.dart';
import 'package:cloudwalk_test/app/modules/details/details_module.dart';
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
    r.module(AppPagesRoutes.home, module: HomeModule());
    r.module(AppPagesRoutes.details, module: DetailsModule());
  }
}
