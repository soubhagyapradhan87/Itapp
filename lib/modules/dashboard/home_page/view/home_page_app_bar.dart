import 'package:flutter/material.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_details_page_view.dart';
import 'package:sidgs_it_app/modules/dashboard/home_page/view/profile_card.dart';

class HomePageAppBar extends StatefulWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  State<HomePageAppBar> createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: ()=>Navigator.of(context).pushNamed(EmployeeDetailsPage.route),
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
               Image.asset("assets/images/dashboard_layout.png",height: 40,width: 40,),
              const ProfileCard()
            ],
          ),
        ),
      ),
    );
  }
}
