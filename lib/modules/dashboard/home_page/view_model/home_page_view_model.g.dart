// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageViewModel on _HomePageViewModel, Store {
  late final _$counterAtom =
      Atom(name: '_HomePageViewModel.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$_HomePageViewModelActionController =
      ActionController(name: '_HomePageViewModel', context: context);

  @override
  void incrementCounter() {
    final _$actionInfo = _$_HomePageViewModelActionController.startAction(
        name: '_HomePageViewModel.incrementCounter');
    try {
      return super.incrementCounter();
    } finally {
      _$_HomePageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter}
    ''';
  }
}
