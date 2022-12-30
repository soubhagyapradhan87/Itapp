import 'package:flutter/material.dart';
import 'package:sidgs_it_app/modules/dashboard/Add_employee_page/view/add_employee_page.dart';

class EmployeeSectionCard extends StatelessWidget {

  IconData? icon;
  String? title;
  EmployeeSectionCard({Key? key,this.icon,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(title=="Add Employee"){
          Navigator.of(context).pushNamed(AddEmployeePage.route);
        }else{
          null;
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue,
                      Colors.cyan,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(icon,color: Colors.white,)
              ),
            ),
            const SizedBox(height: 5,),
            SizedBox(width:80,child: Text(title!,textAlign: TextAlign.center,))
          ],
        ),
      ),
    );
  }
}
