import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_details_page_view.dart';

class EmployeeListCard extends StatelessWidget {
  const EmployeeListCard({Key? key, this.empName, this.empId, this.designation,this.isAccessoriesAssigned,this.document}) : super(key: key);

  final String? empName, empId, designation;
  final bool? isAccessoriesAssigned;
  final DocumentSnapshot? document;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.blueAccent,
            blurRadius: 4.0,
            spreadRadius: 0.05,
            offset: Offset(
              0.5,
              0.5,
            ),
          ),
        ],
        borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
        border: Border.all(color: Colors.blueAccent, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                color: isAccessoriesAssigned==true?Colors.blueAccent:Colors.amberAccent,
                width: 10,
              ),
              Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  empName!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        "Emp Id: ${empId!}",
                        style: TextStyle(fontSize: 14, color: Colors.black45),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        designation!,
                        style: TextStyle(fontSize: 14, color: Colors.black45),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EmployeeDetailsPage.route,arguments: {
                  'document':document
                });
                // Navigator.of(context).pushNamed(
                //   BankListPage.route,
                //   arguments: {
                //     'bankList': viewModel.bankList,
                //   },
                // );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => EmployeeDetailsPage(document: document),
                //   ),
                // );
              },
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.blueAccent,
                size: 25,
              ))
        ],
      ),
    );
  }
}
