// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'HomeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$apodListAtom =
      Atom(name: 'HomeStoreBase.apodList', context: context);

  @override
  List<NasaApodModel>? get apodList {
    _$apodListAtom.reportRead();
    return super.apodList;
  }

  @override
  set apodList(List<NasaApodModel>? value) {
    _$apodListAtom.reportWrite(value, super.apodList, () {
      super.apodList = value;
    });
  }

  late final _$responseAtom =
      Atom(name: 'HomeStoreBase.response', context: context);

  @override
  ObservableFuture<List<NasaApodModel>?> get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(ObservableFuture<List<NasaApodModel>?> value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void getData() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.getData');
    try {
      return super.getData();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
apodList: ${apodList},
response: ${response}
    ''';
  }
}
