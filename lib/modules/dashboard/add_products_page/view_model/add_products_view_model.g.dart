// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_products_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddProductsPageViewModel on _AddProductsPageViewModel, Store {
  Computed<String?>? _$modelErrorComputed;

  @override
  String? get modelError =>
      (_$modelErrorComputed ??= Computed<String?>(() => super.modelError,
              name: '_AddProductsPageViewModel.modelError'))
          .value;
  Computed<bool>? _$canSubmitComputed;

  @override
  bool get canSubmit =>
      (_$canSubmitComputed ??= Computed<bool>(() => super.canSubmit,
              name: '_AddProductsPageViewModel.canSubmit'))
          .value;

  late final _$modelAtom =
      Atom(name: '_AddProductsPageViewModel.model', context: context);

  @override
  String get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(String value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$serialNoAtom =
      Atom(name: '_AddProductsPageViewModel.serialNo', context: context);

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

  late final _$serialNoListAtom =
      Atom(name: '_AddProductsPageViewModel.serialNoList', context: context);

  @override
  List<String> get serialNoList {
    _$serialNoListAtom.reportRead();
    return super.serialNoList;
  }

  @override
  set serialNoList(List<String> value) {
    _$serialNoListAtom.reportWrite(value, super.serialNoList, () {
      super.serialNoList = value;
    });
  }

  late final _$deletedListAtom =
      Atom(name: '_AddProductsPageViewModel.deletedList', context: context);

  @override
  List<String> get deletedList {
    _$deletedListAtom.reportRead();
    return super.deletedList;
  }

  @override
  set deletedList(List<String> value) {
    _$deletedListAtom.reportWrite(value, super.deletedList, () {
      super.deletedList = value;
    });
  }

  late final _$barcodeAtom =
      Atom(name: '_AddProductsPageViewModel.barcode', context: context);

  @override
  String get barcode {
    _$barcodeAtom.reportRead();
    return super.barcode;
  }

  @override
  set barcode(String value) {
    _$barcodeAtom.reportWrite(value, super.barcode, () {
      super.barcode = value;
    });
  }

  late final _$isSubmittingAtom =
      Atom(name: '_AddProductsPageViewModel.isSubmitting', context: context);

  @override
  bool get isSubmitting {
    _$isSubmittingAtom.reportRead();
    return super.isSubmitting;
  }

  @override
  set isSubmitting(bool value) {
    _$isSubmittingAtom.reportWrite(value, super.isSubmitting, () {
      super.isSubmitting = value;
    });
  }

  late final _$clickedCardStringAtom = Atom(
      name: '_AddProductsPageViewModel.clickedCardString', context: context);

  @override
  String get clickedCardString {
    _$clickedCardStringAtom.reportRead();
    return super.clickedCardString;
  }

  @override
  set clickedCardString(String value) {
    _$clickedCardStringAtom.reportWrite(value, super.clickedCardString, () {
      super.clickedCardString = value;
    });
  }

  late final _$ramItemsAtom =
      Atom(name: '_AddProductsPageViewModel.ramItems', context: context);

  @override
  List<String> get ramItems {
    _$ramItemsAtom.reportRead();
    return super.ramItems;
  }

  @override
  set ramItems(List<String> value) {
    _$ramItemsAtom.reportWrite(value, super.ramItems, () {
      super.ramItems = value;
    });
  }

  late final _$hddItemsAtom =
      Atom(name: '_AddProductsPageViewModel.hddItems', context: context);

  @override
  List<String> get hddItems {
    _$hddItemsAtom.reportRead();
    return super.hddItems;
  }

  @override
  set hddItems(List<String> value) {
    _$hddItemsAtom.reportWrite(value, super.hddItems, () {
      super.hddItems = value;
    });
  }

  late final _$processorItemsAtom =
      Atom(name: '_AddProductsPageViewModel.processorItems', context: context);

  @override
  List<String> get processorItems {
    _$processorItemsAtom.reportRead();
    return super.processorItems;
  }

  @override
  set processorItems(List<String> value) {
    _$processorItemsAtom.reportWrite(value, super.processorItems, () {
      super.processorItems = value;
    });
  }

  late final _$scanBarCodeAsyncAction =
      AsyncAction('_AddProductsPageViewModel.scanBarCode', context: context);

  @override
  Future<dynamic> scanBarCode() {
    return _$scanBarCodeAsyncAction.run(() => super.scanBarCode());
  }

  late final _$_AddProductsPageViewModelActionController =
      ActionController(name: '_AddProductsPageViewModel', context: context);

  @override
  void setClickedCardString(String val) {
    final _$actionInfo = _$_AddProductsPageViewModelActionController
        .startAction(name: '_AddProductsPageViewModel.setClickedCardString');
    try {
      return super.setClickedCardString(val);
    } finally {
      _$_AddProductsPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModel(String val) {
    final _$actionInfo = _$_AddProductsPageViewModelActionController
        .startAction(name: '_AddProductsPageViewModel.setModel');
    try {
      return super.setModel(val);
    } finally {
      _$_AddProductsPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSerialNo(String srVal) {
    final _$actionInfo = _$_AddProductsPageViewModelActionController
        .startAction(name: '_AddProductsPageViewModel.setSerialNo');
    try {
      return super.setSerialNo(srVal);
    } finally {
      _$_AddProductsPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void chipDeletion(int i) {
    final _$actionInfo = _$_AddProductsPageViewModelActionController
        .startAction(name: '_AddProductsPageViewModel.chipDeletion');
    try {
      return super.chipDeletion(i);
    } finally {
      _$_AddProductsPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchRam() {
    final _$actionInfo = _$_AddProductsPageViewModelActionController
        .startAction(name: '_AddProductsPageViewModel.fetchRam');
    try {
      return super.fetchRam();
    } finally {
      _$_AddProductsPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchHdd() {
    final _$actionInfo = _$_AddProductsPageViewModelActionController
        .startAction(name: '_AddProductsPageViewModel.fetchHdd');
    try {
      return super.fetchHdd();
    } finally {
      _$_AddProductsPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchProcessor() {
    final _$actionInfo = _$_AddProductsPageViewModelActionController
        .startAction(name: '_AddProductsPageViewModel.fetchProcessor');
    try {
      return super.fetchProcessor();
    } finally {
      _$_AddProductsPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
serialNo: ${serialNo},
serialNoList: ${serialNoList},
deletedList: ${deletedList},
barcode: ${barcode},
isSubmitting: ${isSubmitting},
clickedCardString: ${clickedCardString},
ramItems: ${ramItems},
hddItems: ${hddItems},
processorItems: ${processorItems},
modelError: ${modelError},
canSubmit: ${canSubmit}
    ''';
  }
}
