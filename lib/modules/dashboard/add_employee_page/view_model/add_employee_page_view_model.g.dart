// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_employee_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddEmployeePageViewModel on _AddEmployeePageViewModel, Store {
  Computed<String?>? _$accessoriesErrorComputed;

  @override
  String? get accessoriesError => (_$accessoriesErrorComputed ??=
          Computed<String?>(() => super.accessoriesError,
              name: '_AddEmployeePageViewModel.accessoriesError'))
      .value;
  Computed<bool>? _$canSubmitComputed;

  @override
  bool get canSubmit =>
      (_$canSubmitComputed ??= Computed<bool>(() => super.canSubmit,
              name: '_AddEmployeePageViewModel.canSubmit'))
          .value;

  late final _$selectedRadioAtom =
      Atom(name: '_AddEmployeePageViewModel.selectedRadio', context: context);

  @override
  int get selectedRadio {
    _$selectedRadioAtom.reportRead();
    return super.selectedRadio;
  }

  @override
  set selectedRadio(int value) {
    _$selectedRadioAtom.reportWrite(value, super.selectedRadio, () {
      super.selectedRadio = value;
    });
  }

  late final _$_AddEmployeePageViewModelActionController =
      ActionController(name: '_AddEmployeePageViewModel', context: context);

  @override
  dynamic setSelectedRadio(int val) {
    final _$actionInfo = _$_AddEmployeePageViewModelActionController
        .startAction(name: '_AddEmployeePageViewModel.setSelectedRadio');
    try {
      return super.setSelectedRadio(val);
    } finally {
      _$_AddEmployeePageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedRadio: ${selectedRadio},
accessoriesError: ${accessoriesError},
canSubmit: ${canSubmit}
    ''';
  }
}
