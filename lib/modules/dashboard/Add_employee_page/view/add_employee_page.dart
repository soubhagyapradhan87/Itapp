import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidgs_it_app/modules/common/component/common_button.dart';
import 'package:sidgs_it_app/modules/dashboard/Add_employee_page/view_model/add_employee_page_view_model.dart';

class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({Key? key}) : super(key: key);

  static const route = '/add_employee_page';

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return AddEmployeePageViewModel();
      },
      child: const AddEmployeePageScaffold(),
    );
  }
}

class AddEmployeePageScaffold extends StatefulWidget {
  const AddEmployeePageScaffold({super.key});

  @override
  State<AddEmployeePageScaffold> createState() => _AddEmployeePageScaffoldState();
}

class _AddEmployeePageScaffoldState extends State<AddEmployeePageScaffold> {
  AddEmployeePageViewModel get viewModel => context.read<AddEmployeePageViewModel>();
  late TextEditingController _nameTextFieldController;

  @override
  void initState() {
    _nameTextFieldController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Add Employee",
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
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: _nameTextFieldController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Employee Name',
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: _nameTextFieldController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Employee Id',
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: _nameTextFieldController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Mobile No',
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: _nameTextFieldController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Location',
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: _nameTextFieldController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Gender',
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: _nameTextFieldController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Official Mail Id',
                  ),
                ),
                const SizedBox(height: 25,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CommonButton(onPressed: (){},title: "Add",),
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
