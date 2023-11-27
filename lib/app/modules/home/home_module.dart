import 'package:cloudwalk_test/app/modules/home/interfaces/ihttp_client.dart';
import 'package:cloudwalk_test/app/modules/home/interfaces/ilocal_db_client.dart';
import 'package:cloudwalk_test/app/modules/home/repositories/nasa_api_repository.dart';
import 'package:cloudwalk_test/app/modules/home/repositories/nasa_db_local_repository.dart';
import 'package:cloudwalk_test/app/modules/home/services/dio_client.dart';
import 'package:cloudwalk_test/app/modules/home/services/hive_service.dart';
import 'package:cloudwalk_test/app/shared/widgets/connectivity_status/connectivity_status_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add(HomeStore.new);
    i.add<IHttpClient>(DioClient.new);
    i.add(NasaApiRepository.new);
    i.add<ILocalDbClient>(HiveService.new);
    i.add(NasaDbLocalRepository.new);
    i.addInstance<ConnectivityStatusStore>(ConnectivityStatusStore());
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const HomePage());
  }
}
