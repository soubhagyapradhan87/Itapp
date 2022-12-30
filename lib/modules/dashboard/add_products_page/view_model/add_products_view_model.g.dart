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
  String toString() {
    return '''
model: ${model},
isSubmitting: ${isSubmitting},
clickedCardString: ${clickedCardString},
modelError: ${modelError},
canSubmit: ${canSubmit}
    ''';
  }
}
