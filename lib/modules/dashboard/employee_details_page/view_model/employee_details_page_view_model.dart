import 'package:mobx/mobx.dart';

part 'employee_details_page_view_model.g.dart';

class EmployeeDetailsPageViewModel = _EmployeeDetailsPageViewModel with _$EmployeeDetailsPageViewModel;

abstract class _EmployeeDetailsPageViewModel with Store {

  @observable
  String employeeCardTitle = '';

  @action
  void setClickedCardString(String val) {
    if(employeeCardTitle.isEmpty) {
      employeeCardTitle = val;
    }else{
      employeeCardTitle='';
    }
  }


}