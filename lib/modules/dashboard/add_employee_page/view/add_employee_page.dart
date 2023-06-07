import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sidgs_it_app/modules/common/component/common_button.dart';
import 'package:sidgs_it_app/modules/dashboard/Add_employee_page/view_model/add_employee_page_view_model.dart';
import 'package:sidgs_it_app/modules/dashboard/accessories_page/view/accessories_page_view.dart';


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
  late TextEditingController _empIdTextFieldController;
  late TextEditingController _mobileNoTextFieldController;
  late TextEditingController _locationTextFieldController;
  late TextEditingController _genderTextFieldController;
  late TextEditingController _officialMailIdTextFieldController;
  late TextEditingController _designationTextFieldController;

  @override
  void initState() {
    _nameTextFieldController = TextEditingController();
    _empIdTextFieldController = TextEditingController();
    _mobileNoTextFieldController = TextEditingController();
    _locationTextFieldController = TextEditingController();
    _genderTextFieldController = TextEditingController();
    _officialMailIdTextFieldController = TextEditingController();
    _designationTextFieldController = TextEditingController();
    super.initState();
  }

  void showSnackbar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      backgroundColor: color,
      duration: Duration(seconds: 3),
      content: Text(message),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'dismiss',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Observer(
              builder: (context) {
                return Column(
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
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _nameTextFieldController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Employee Name',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _empIdTextFieldController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Employee Id',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _designationTextFieldController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Designation',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _mobileNoTextFieldController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Mobile No',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _locationTextFieldController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Location',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _genderTextFieldController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Gender',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _officialMailIdTextFieldController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Official Mail Id',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Do you want to assign accessories?",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title: const Text("Yes"),
                            value: 1,
                            groupValue: viewModel.selectedRadio,
                            activeColor: Colors.blueAccent,
                            onChanged: (val) {
                              viewModel.setSelectedRadio(val!);
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            title: const Text("No"),
                            value: 2,
                            groupValue: viewModel.selectedRadio,
                            activeColor: Colors.blueAccent,
                            onChanged: (val) {
                              viewModel.setSelectedRadio(val!);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CommonButton(
                          onPressed: viewModel.canSubmit
                              ? () async {
                                  Navigator.of(context).pushNamed(AccessoriesPage.route);
                                  // if (await FireBaseService()
                                  //         .documentExistsInCollection("employees", _empIdTextFieldController.text) !=
                                  //     true) {
                                  //   FireBaseService().addEmployee(
                                  //       _nameTextFieldController.text,
                                  //       _empIdTextFieldController.text,
                                  //       _designationTextFieldController.text,
                                  //       _mobileNoTextFieldController.text,
                                  //       _locationTextFieldController.text,
                                  //       _genderTextFieldController.text,
                                  //       _officialMailIdTextFieldController.text,
                                  //       viewModel.selectedRadio == 1 ? true : false);
                                  //   if (viewModel.selectedRadio == 1) {
                                  //     Navigator.of(context).pushNamed(AccessoriesPage.route);
                                  //   } else {
                                  //     Navigator.of(context).pushNamed(HomePage.route);
                                  //     showSnackbar(context, "Employee Added without accessories",Colors.amber);
                                  //   }
                                  // } else {
                                  //   showSnackbar(context, "Employee Id already exists",Colors.red);
                                  // }
                                }
                              : () {
                                  showSnackbar(context, "Please select accessories option !!!", Colors.black);
                                },
                          title: viewModel.selectedRadio == 1 ? "Save and continue" : "Add Employee",
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        )));
  }
}
