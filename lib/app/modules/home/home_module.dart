import 'package:cloudwalk_test/app/app_module.dart';
import 'package:cloudwalk_test/app/modules/home/interfaces/ihttp_client.dart';
import 'package:cloudwalk_test/app/modules/home/repositories/nasa_api_repository.dart';
import 'package:cloudwalk_test/app/modules/home/services/dio_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add(HomeStore.new);
    i.add<IHttpClient>(DioClient.new);
    i.add(NasaApiRepository.new);
  }

  @override
  List<Module> get imports => [AppModule()];

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const HomePage());
  }
}
