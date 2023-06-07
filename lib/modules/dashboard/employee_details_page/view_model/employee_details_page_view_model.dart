import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'employee_details_page_view_model.g.dart';

class EmployeeDetailsPageViewModel = _EmployeeDetailsPageViewModel with _$EmployeeDetailsPageViewModel;

abstract class _EmployeeDetailsPageViewModel with Store {

  _EmployeeDetailsPageViewModel({required this.document}) {}

  final DocumentSnapshot document;

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