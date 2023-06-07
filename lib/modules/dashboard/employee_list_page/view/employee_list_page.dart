import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_list_page/view/employee_list_card.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_list_page/view_model/employee_list_page_view_model.dart';

class EmployeeListPage extends StatelessWidget {
  const EmployeeListPage({Key? key}) : super(key: key);

  static const route = '/employee_list_page';

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return EmployeeListPageViewModel();
      },
      child: const EmployeeListPageScaffold(),
    );
  }
}

class EmployeeListPageScaffold extends StatefulWidget {
  const EmployeeListPageScaffold({super.key});

  @override
  State<EmployeeListPageScaffold> createState() => _EmployeeListPageScaffoldState();
}

class _EmployeeListPageScaffoldState extends State<EmployeeListPageScaffold> {
  EmployeeListPageViewModel get viewModel => context.read<EmployeeListPageViewModel>();
  late TextEditingController _searchTextFieldController;

  @override
  void initState() {
    _searchTextFieldController = TextEditingController();
    super.initState();
  }

  final Stream<QuerySnapshot> employeeStream = FirebaseFirestore.instance.collection('employees').orderBy("emp_id",descending: false).snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Employee List",
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
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              TextField(
                controller: _searchTextFieldController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Search here',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  labelText: 'Search here',
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: employeeStream,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                          strokeWidth: 5,
                        ),
                      );
                    }
                    // return ListView(
                    //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    //     Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    //     return Padding(
                    //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    //       child: EmployeeListCard(
                    //         empName: data['emp_name'],
                    //         empId: data['emp_id'],
                    //         designation: data['designation'],
                    //         isAccessoriesAssigned: data['is_accessories_assigned'],
                    //       ),
                    //     );
                    //   }).toList(),
                    // );

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        var document = snapshot.data!.docs[index];

                        return GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(
                            //   context,
                            //   '/details',
                            //   arguments: document,
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: EmployeeListCard(
                              empName: document['emp_name'],
                              empId: document['emp_id'],
                              designation: document['designation'],
                              isAccessoriesAssigned: document['is_accessories_assigned'],
                              document: document,
                            ),
                          ),
                        );
                      },
                    );

                  },
                ),
              ),
            ],
          ),
        )));
  }
}
