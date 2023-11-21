import 'package:cloudwalk_test/app/modules/home/repositories/nasa_api_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add(HomeStore.new);
    i.add(NasaApiRepository.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const HomePage());
  }
}
