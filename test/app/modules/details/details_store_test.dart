import 'package:cloudwalk_test/app/modules/details/details_module.dart';
import 'package:cloudwalk_test/app/modules/details/details_store.dart';
import 'package:cloudwalk_test/app/shared/widgets/connectivity_status/connectivity_status_store.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart' as mock;

import 'details_store_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  group('DetailsStore', () {
    late DetailsStore store;
    final MockConnectivity mockConnectivity = MockConnectivity();
    final ConnectivityStatusStore connectivityStatusStore =
        ConnectivityStatusStore(connectivity: mockConnectivity);
    Modular.bindModule(DetailsModule());
    Modular.replaceInstance<ConnectivityStatusStore>(connectivityStatusStore);

    setUp(() {
      store = Modular.get<DetailsStore>();
      mock
          .when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);
      store.setupReactions();
    });

    tearDown(() {
      mock.reset(mockConnectivity);
      store.dispose();
    });

    test('initial values', () {
      expect(store.hasSignal, true);
    });

    test('changeStatusSignal', () {
      store.changeStatusSignal(false);
      expect(store.hasSignal, false);

      store.changeStatusSignal(true);
      expect(store.hasSignal, true);
    });

    test('reaction when connectivity changes to none', () async {
      mock
          .when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);

      connectivityStatusStore.checkConnectivityStatus();

      await connectivityStatusStore.checkConnectivity;

      store.setupReactions();

      expect(store.hasSignal, false);
    });

    test('reaction when connectivity changes to mobile', () async {
      mock
          .when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.mobile);

      connectivityStatusStore.checkConnectivityStatus();

      await connectivityStatusStore.checkConnectivity;

      store.setupReactions();

      expect(store.hasSignal, true);
    });
  });
}
