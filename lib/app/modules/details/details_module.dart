import 'package:cloudwalk_test/app/app_module.dart';
import 'package:cloudwalk_test/app/modules/details/details_page.dart';
import 'package:cloudwalk_test/app/modules/details/details_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsModule extends Module {
  @override
  void binds(i) {
    i.add(DetailsStore.new);
  }

  @override
  List<Module> get imports => [AppModule()];

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => DetailsPage(
              model: r.args.data,
            ));
  }
}
