import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_accessories_component.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_card.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_details_component.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view_model/employee_details_page_view_model.dart';
import 'package:sidgs_it_app/modules/services/firebase_service.dart';

class EmployeeDetailsPage extends StatelessWidget {
  const EmployeeDetailsPage({Key? key, required this.document}) : super(key: key);

  final DocumentSnapshot document;

  static const route = '/employee_details_page';

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return EmployeeDetailsPageViewModel(document: document);
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

  // FirebaseFirestore.instance
  //     .collection('countries')
  //     .where('countryName', isEqualTo: "theCountryNameUserClickedOn")
  //     .get()
  CollectionReference employees = FirebaseFirestore.instance.collection('employees');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          pinned: true,
          snap: false,
          floating: false,
          stretch: false,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
              fit: BoxFit.fill,
            ),
            title: Text(
              viewModel.document['emp_name'],
              textScaleFactor: 0.8,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Observer(
            builder: (context) {
              return Column(children: [
                // const EmployeeProfileComponent(),
                const SizedBox(
                  height: 40,
                ),
                EmployeeCard(
                  title: "Employee Details",
                  icon: Icons.work_outline,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: viewModel.employeeCardTitle == "Employee Details"
                      ? EmployeeDetailsComponent(
                          designation: viewModel.document['designation'],
                          empId: viewModel.document['emp_id'],
                          mobileNo: viewModel.document['mobile_no'],
                          location: viewModel.document['location'],
                          gender: viewModel.document['gender'],
                          officialMailId: viewModel.document['official_mail_id'],
                        )
                      : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                EmployeeCard(
                  title: "Accessories",
                  icon: Icons.devices_other_outlined,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: viewModel.employeeCardTitle == "Accessories"
                      ?
                      // const EmployeeAccessoriesComponent()
                      FutureBuilder<DocumentSnapshot>(
                          future: FireBaseService().fetchSubcollectionDocument(viewModel.document['emp_id']),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator();

                            } else if (snapshot.data!=null) {
                              // var data = snapshot.data;
                              Map<String, dynamic>? laptop = snapshot.data!['laptop'];
                              Map<String, dynamic>? desktop = snapshot.data!['desktop'];
                              print(laptop?['company']);

                              return EmployeeAccessoriesComponent(
                                laptopData: laptop,
                                desktopData: desktop,
                              );
                            } else {
                              return const Text('Subcollection document not found.');
                            }
                          })
                      : null,
                ),
              ]);
            },
          ),
        )
      ],
    )));
  }
}
