import 'package:flutter/material.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_details_page_view.dart';

class EmployeeListCard extends StatelessWidget {
  const EmployeeListCard({Key? key}) : super(key: key);

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
                color: Colors.blueAccent,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Soubhagya Pradhan",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                "Software Developer",
                style: TextStyle(fontSize: 14, color: Colors.black45),
              ),
            ],
          ),
           IconButton(
               onPressed: (){
                 Navigator.of(context).pushNamed(EmployeeDetailsPage.route);
               },
               icon:const Icon(
                 Icons.arrow_forward_ios_rounded,
                 color: Colors.blueAccent,
                 size: 30,
               )
           )
        ],
      ),
    );
  }
}
