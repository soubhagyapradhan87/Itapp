import 'package:flutter/material.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_details_card.dart';

class EmployeeDetailsComponent extends StatelessWidget {
  const EmployeeDetailsComponent({Key? key}) : super(key: key);

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
                title: "Full Name",
                description: "Soubhagya Pradhan",
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
                description: "SID E-404",
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: EmployeeDetailsCard(
                title: "Mobile No",
                description: "7008814182",
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
                description: "Hyderabad",
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: EmployeeDetailsCard(
                title: "Gender",
                description: "Male",
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
                description: "soubhagyap@sidgs.com",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
