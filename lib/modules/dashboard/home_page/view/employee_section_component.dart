import 'package:flutter/material.dart';
import 'package:sidgs_it_app/modules/dashboard/home_page/view/employee_section_card.dart';

class EmployeeSectionComponent extends StatelessWidget {
   EmployeeSectionComponent({Key? key}) : super(key: key);

  List employeeIcon = [
    Icons.person_add_alt_1_outlined,
    Icons.person_remove_alt_1_outlined,
    Icons.groups_outlined,


  ];
   List employeeTitle = [
     "Add Employee",
     "Remove Employee",
     "Employee Lists",

   ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,

      child: ListView.builder(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: employeeTitle.length,
          itemBuilder: (context, index) {
            return EmployeeSectionCard(
              icon: employeeIcon[index],
              title: employeeTitle[index],
            );
          }),
    );
  }
}
