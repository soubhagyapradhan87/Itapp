import 'package:flutter/material.dart';

class EmployeeDetailsCard extends StatelessWidget {
  String? title;
  String? description;
  EmployeeDetailsCard({Key? key,this.title,this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: const Color(0xFFD4E7FD),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!,style: const TextStyle(fontSize: 14,color: Colors.black26),),
            Text(description!,style: const TextStyle(fontSize: 18,color: Colors.black54))
          ],
        ),
      ),
    );
  }
}
