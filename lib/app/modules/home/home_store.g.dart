// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<bool>? _$isLoadingDataComputed;

  @override
  bool get isLoadingData =>
      (_$isLoadingDataComputed ??= Computed<bool>(() => super.isLoadingData,
              name: 'HomeStoreBase.isLoadingData'))
          .value;

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

  late final _$searchValueAtom =
      Atom(name: 'HomeStoreBase.searchValue', context: context);

  @override
  String get searchValue {
    _$searchValueAtom.reportRead();
    return super.searchValue;
  }

  @override
  set searchValue(String value) {
    _$searchValueAtom.reportWrite(value, super.searchValue, () {
      super.searchValue = value;
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
  void getApiData() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.getApiData');
    try {
      return super.getApiData();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getLocalData() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.getLocalData');
    try {
      return super.getLocalData();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeList() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeList');
    try {
      return super.changeList();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchValue(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeSearchValue');
    try {
      return super.changeSearchValue(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterApodList(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.filterApodList');
    try {
      return super.filterApodList(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
apodList: ${apodList},
searchValue: ${searchValue},
response: ${response},
isLoadingData: ${isLoadingData}
    ''';
  }
}
