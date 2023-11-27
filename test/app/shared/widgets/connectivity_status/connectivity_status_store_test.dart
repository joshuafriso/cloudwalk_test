import 'dart:async';

import 'package:async/async.dart';
import 'package:cloudwalk_test/app/shared/widgets/connectivity_status/connectivity_status_store.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart' as mock;

import 'connectivity_status_store_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  late ConnectivityStatusStore store;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    store = ConnectivityStatusStore(connectivity: mockConnectivity);
  });
  group("Connctivity Status Store", () {
    test('initial values', () {
      expect(store.noSignal, false);
      expect(store.checkConnectivity.value, ConnectivityResult.mobile);
    });

    test("Listen the stream status change", () async {
      mock.when(mockConnectivity.onConnectivityChanged).thenAnswer((_) =>
          Stream.fromIterable([
            ConnectivityResult.none,
            ConnectivityResult.wifi,
            ConnectivityResult.mobile
          ]));
      store.connectivityStream =
          ObservableStream(mockConnectivity.onConnectivityChanged);
      final streamQueue = StreamQueue(store.connectivityStream);
      expect(await streamQueue.next, ConnectivityResult.none);
      expect(await streamQueue.next, ConnectivityResult.wifi);
      expect(await streamQueue.next, ConnectivityResult.mobile);
    });

    test(
        "returns a ConnectivityResult value for initial ObservableFuture checkConnectivity",
        () async {
      final checkConnectivity = store.checkConnectivity;

      final connectivityResult = await checkConnectivity;

      expect(connectivityResult, isA<ConnectivityResult>());

      expect(connectivityResult, ConnectivityResult.mobile);
    });

    test("when noSignal value is false and changes to true", () {
      expect(store.noSignal, false);
      store.changeStatus(true);
      expect(store.noSignal, true);
    });

    test(
        "returns a ConnectivityResult value and subscribe the checkConnectivity",
        () async {
      const result = ConnectivityResult.wifi;

      mock
          .when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => result);

      store.checkConnectivityStatus();

      final checkConnectivity = store.checkConnectivity;

      final connectivityResult = await checkConnectivity;

      expect(connectivityResult, result);
    });
  });
}
