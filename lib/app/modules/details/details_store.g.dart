// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsStore on DetailsStoreBase, Store {
  late final _$hasSignalAtom =
      Atom(name: 'DetailsStoreBase.hasSignal', context: context);

  @override
  bool get hasSignal {
    _$hasSignalAtom.reportRead();
    return super.hasSignal;
  }

  @override
  set hasSignal(bool value) {
    _$hasSignalAtom.reportWrite(value, super.hasSignal, () {
      super.hasSignal = value;
    });
  }

  late final _$DetailsStoreBaseActionController =
      ActionController(name: 'DetailsStoreBase', context: context);

  @override
  void changeStatusSignal(bool value) {
    final _$actionInfo = _$DetailsStoreBaseActionController.startAction(
        name: 'DetailsStoreBase.changeStatusSignal');
    try {
      return super.changeStatusSignal(value);
    } finally {
      _$DetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasSignal: ${hasSignal}
    ''';
  }
}
