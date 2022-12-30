import 'package:flutter/material.dart';

class EmployeeProfileComponent extends StatelessWidget {
  const EmployeeProfileComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.cyan,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
            child: Container(
              width: 90,
              height: 90,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Soubhagya Pradhan",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Text(
                "Software Developer",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
