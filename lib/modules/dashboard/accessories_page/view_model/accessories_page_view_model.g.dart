// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessories_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccessoriesPageViewModel on _AccessoriesPageViewModel, Store {
  late final _$serialNoAtom =
      Atom(name: '_AccessoriesPageViewModel.serialNo', context: context);

  @override
  String get serialNo {
    _$serialNoAtom.reportRead();
    return super.serialNo;
  }

  @override
  set serialNo(String value) {
    _$serialNoAtom.reportWrite(value, super.serialNo, () {
      super.serialNo = value;
    });
  }

  late final _$checkSerialNoAsyncAction =
      AsyncAction('_AccessoriesPageViewModel.checkSerialNo', context: context);

  @override
  Future<bool> checkSerialNo(String val) {
    return _$checkSerialNoAsyncAction.run(() => super.checkSerialNo(val));
  }

  late final _$scanBarCodeAsyncAction =
      AsyncAction('_AccessoriesPageViewModel.scanBarCode', context: context);

  @override
  Future<dynamic> scanBarCode() {
    return _$scanBarCodeAsyncAction.run(() => super.scanBarCode());
  }

  @override
  String toString() {
    return '''
serialNo: ${serialNo}
    ''';
  }
}
