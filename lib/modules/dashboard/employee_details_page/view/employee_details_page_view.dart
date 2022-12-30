import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_accessories_component.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_card.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_details_component.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_profile_component.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view_model/employee_details_page_view_model.dart';

class EmployeeDetailsPage extends StatelessWidget {
  const EmployeeDetailsPage({Key? key}) : super(key: key);

  static const route = '/employee_details_page';

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return EmployeeDetailsPageViewModel();
      },
      child: const EmployeeDetailsPageScaffold(),
    );
  }
}

class EmployeeDetailsPageScaffold extends StatefulWidget {
  const EmployeeDetailsPageScaffold({super.key});

  @override
  State<EmployeeDetailsPageScaffold> createState() => _EmployeeDetailsPageScaffoldState();
}

class _EmployeeDetailsPageScaffoldState extends State<EmployeeDetailsPageScaffold> {
  EmployeeDetailsPageViewModel get viewModel => context.read<EmployeeDetailsPageViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Employee Details",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(child: SingleChildScrollView(
          child: Observer(
            builder: (context) {
              return Column(children: [
                const EmployeeProfileComponent(),
                const SizedBox(
                  height: 40,
                ),
                EmployeeCard(
                  title: "Employee Details",
                  icon: Icons.work_outline,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: viewModel.employeeCardTitle=="Employee Details"?
                  const EmployeeDetailsComponent()
                      :null,
                ),
                const SizedBox(
                  height: 20,
                ),
                EmployeeCard(
                  title: "Accessories",
                  icon: Icons.devices_other_outlined,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: viewModel.employeeCardTitle=="Accessories"?
                  const EmployeeAccessoriesComponent()
                      :null,
                ),
              ]);
            },
          ),
        )));
  }
}
