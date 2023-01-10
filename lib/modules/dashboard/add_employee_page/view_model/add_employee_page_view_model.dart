import 'package:easy_localization/easy_localization.dart';
import 'package:mobx/mobx.dart';
import 'package:sidgs_it_app/generated/locale_keys.g.dart';

part 'add_employee_page_view_model.g.dart';

class AddEmployeePageViewModel = _AddEmployeePageViewModel with _$AddEmployeePageViewModel;

abstract class _AddEmployeePageViewModel with Store {


  @observable
  int selectedRadio=0;

  @computed
  String? get accessoriesError {
    if (selectedRadio==0) {
      return LocaleKeys.requiredError.tr();
    }
    return null;
  }
  @computed
  bool get canSubmit => accessoriesError == null;

  @action
  setSelectedRadio(int val) {
    selectedRadio = val;
  }

}