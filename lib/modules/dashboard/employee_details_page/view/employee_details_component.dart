import 'package:flutter/material.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_details_card.dart';

class EmployeeDetailsComponent extends StatelessWidget {
  const EmployeeDetailsComponent({Key? key,this.designation,this.empId,this.mobileNo,this.location,this.gender,this.officialMailId}) : super(key: key);

  final String? designation,empId,mobileNo,location,gender,officialMailId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EmployeeDetailsCard(
                title: "Designation",
                value: designation,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: EmployeeDetailsCard(
                title: "Emp ID",
                value: empId,
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: EmployeeDetailsCard(
                title: "Mobile No",
                value: mobileNo,
              ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: EmployeeDetailsCard(
                title: "Location",
                value: location,
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: EmployeeDetailsCard(
                title: "Gender",
                value: gender,
              ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EmployeeDetailsCard(
                title: "Official MailId",
                value: officialMailId,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
