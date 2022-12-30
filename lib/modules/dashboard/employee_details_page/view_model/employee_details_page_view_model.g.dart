// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_details_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeeDetailsPageViewModel on _EmployeeDetailsPageViewModel, Store {
  late final _$employeeCardTitleAtom = Atom(
      name: '_EmployeeDetailsPageViewModel.employeeCardTitle',
      context: context);

  @override
  String get employeeCardTitle {
    _$employeeCardTitleAtom.reportRead();
    return super.employeeCardTitle;
  }

  @override
  set employeeCardTitle(String value) {
    _$employeeCardTitleAtom.reportWrite(value, super.employeeCardTitle, () {
      super.employeeCardTitle = value;
    });
  }

  late final _$_EmployeeDetailsPageViewModelActionController =
      ActionController(name: '_EmployeeDetailsPageViewModel', context: context);

  @override
  void setClickedCardString(String val) {
    final _$actionInfo =
        _$_EmployeeDetailsPageViewModelActionController.startAction(
            name: '_EmployeeDetailsPageViewModel.setClickedCardString');
    try {
      return super.setClickedCardString(val);
    } finally {
      _$_EmployeeDetailsPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
employeeCardTitle: ${employeeCardTitle}
    ''';
  }
}
