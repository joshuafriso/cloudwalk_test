// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_status_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectivityStatusStore on ConnectivityStatusStoreBase, Store {
  late final _$connectivityStreamAtom = Atom(
      name: 'ConnectivityStatusStoreBase.connectivityStream', context: context);

  @override
  ObservableStream<ConnectivityResult> get connectivityStream {
    _$connectivityStreamAtom.reportRead();
    return super.connectivityStream;
  }

  @override
  set connectivityStream(ObservableStream<ConnectivityResult> value) {
    _$connectivityStreamAtom.reportWrite(value, super.connectivityStream, () {
      super.connectivityStream = value;
    });
  }

  late final _$checkConnectivityAtom = Atom(
      name: 'ConnectivityStatusStoreBase.checkConnectivity', context: context);

  @override
  ObservableFuture<ConnectivityResult> get checkConnectivity {
    _$checkConnectivityAtom.reportRead();
    return super.checkConnectivity;
  }

  @override
  set checkConnectivity(ObservableFuture<ConnectivityResult> value) {
    _$checkConnectivityAtom.reportWrite(value, super.checkConnectivity, () {
      super.checkConnectivity = value;
    });
  }

  late final _$noSignalAtom =
      Atom(name: 'ConnectivityStatusStoreBase.noSignal', context: context);

  @override
  bool get noSignal {
    _$noSignalAtom.reportRead();
    return super.noSignal;
  }

  @override
  set noSignal(bool value) {
    _$noSignalAtom.reportWrite(value, super.noSignal, () {
      super.noSignal = value;
    });
  }

  late final _$ConnectivityStatusStoreBaseActionController =
      ActionController(name: 'ConnectivityStatusStoreBase', context: context);

  @override
  void changeStatus(bool value) {
    final _$actionInfo = _$ConnectivityStatusStoreBaseActionController
        .startAction(name: 'ConnectivityStatusStoreBase.changeStatus');
    try {
      return super.changeStatus(value);
    } finally {
      _$ConnectivityStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkConnectivityStatus() {
    final _$actionInfo =
        _$ConnectivityStatusStoreBaseActionController.startAction(
            name: 'ConnectivityStatusStoreBase.checkConnectivityStatus');
    try {
      return super.checkConnectivityStatus();
    } finally {
      _$ConnectivityStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectivityStream: ${connectivityStream},
checkConnectivity: ${checkConnectivity},
noSignal: ${noSignal}
    ''';
  }
}
