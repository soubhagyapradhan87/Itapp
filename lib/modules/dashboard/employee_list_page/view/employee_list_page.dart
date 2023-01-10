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
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
                      itemBuilder: (context, position) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                          child: EmployeeListCard(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
