import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sidgs_it_app/modules/common/component/common_button.dart';
import 'package:sidgs_it_app/modules/common/component/primary_text_field.dart';
import 'package:sidgs_it_app/modules/dashboard/add_products_page/view/product_card.dart';
import 'package:sidgs_it_app/modules/dashboard/add_products_page/view_model/add_products_view_model.dart';
import 'package:sidgs_it_app/modules/services/firebase_service.dart';

import '../../home_page/view/home_page_view.dart';

class AddProductsPage extends StatelessWidget {
  const AddProductsPage({Key? key}) : super(key: key);

  static const route = '/add_products_page';

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return AddProductsPageViewModel();
      },
      child: const AddProductsPageScaffold(),
    );
  }
}

class AddProductsPageScaffold extends StatefulWidget {
  const AddProductsPageScaffold({Key? key}) : super(key: key);

  @override
  State<AddProductsPageScaffold> createState() => _AddProductsPageScaffoldState();
}

class _AddProductsPageScaffoldState extends State<AddProductsPageScaffold> {
  List productList = ["Laptop", "Desktop", "Mouse", "Headphone"];

  List productIcons = [Icons.laptop_mac, Icons.monitor, Icons.mouse_outlined, Icons.headphones];

  late final TextEditingController _companyTextEditingController = TextEditingController();
  late final TextEditingController _modelTextEditingController;
  late final TextEditingController _serialNoTextEditingController = TextEditingController();
  late final TextEditingController _processorTextEditingController = TextEditingController();
  late final TextEditingController _hDDTextEditingController = TextEditingController();
  late final TextEditingController _ramTextEditingController = TextEditingController();

  CollectionReference student = FirebaseFirestore.instance.collection('ram');

  AddProductsPageViewModel get viewModel => context.read<AddProductsPageViewModel>();

  @override
  void initState() {
    _modelTextEditingController = TextEditingController(text: viewModel.model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Product",
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
          child: Observer(
            builder: (context) {
              _serialNoTextEditingController.text = viewModel.serialNo;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              child: ProductCard(
                                productName: productList[index],
                                icon: productIcons[index],
                              ),
                            );
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: viewModel.clickedCardString.isNotEmpty
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Product Details:",
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              ),
                            ],
                          )
                        : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (viewModel.clickedCardString == "Laptop") ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          PrimaryTextField(
                            autofocus: false,
                            controller: _companyTextEditingController,
                            onChanged: (val) {},
                            label: "Company Name",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PrimaryTextField(
                            autofocus: false,
                            controller: _modelTextEditingController,
                            onChanged: (val) {
                              viewModel.setModel(val);
                            },
                            errorText: viewModel.modelError,
                            label: "Model",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "RAM (in GB) :",
                                style: TextStyle(color: Colors.black54, fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: TextField(
                                      autofocus: false,
                                      controller: _ramTextEditingController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Please Select RAM',
                                      ),
                                    ),
                                  ),
                                  PopupMenuButton<String>(
                                      icon: const Icon(Icons.arrow_drop_down),
                                      onSelected: (String value) {
                                        _ramTextEditingController.text = "$value GB";
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return viewModel.ramItems.map((String value) {
                                          return PopupMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList();
                                      })
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "HDD (in GB) :",
                                style: TextStyle(color: Colors.black54, fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: TextField(
                                      autofocus: false,
                                      controller: _hDDTextEditingController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Please Select HDD',
                                      ),
                                    ),
                                  ),
                                  PopupMenuButton<String>(
                                      icon: const Icon(Icons.arrow_drop_down),
                                      onSelected: (String value) {
                                        _hDDTextEditingController.text = "$value GB";
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return viewModel.hddItems.map((String value) {
                                          return PopupMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList();
                                      })
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Processor :",
                                style: TextStyle(color: Colors.black54, fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: TextField(
                                      autofocus: false,
                                      controller: _processorTextEditingController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Please Select processor',
                                      ),
                                    ),
                                  ),
                                  PopupMenuButton<String>(
                                      icon: const Icon(Icons.arrow_drop_down),
                                      onSelected: (String value) {
                                        _processorTextEditingController.text = "$value";
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return viewModel.processorItems.map((String value) {
                                          return PopupMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList();
                                      })
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Number of item :",
                                style: TextStyle(color: Colors.black54, fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 48, 0),
                                child: Container(
                                  width: 150,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey, width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          viewModel.serialNoList.length.toString(),
                                          style: const TextStyle(
                                              color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Serial No :",
                                style: TextStyle(color: Colors.black54, fontSize: 16),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Wrap(
                                      spacing: 2,
                                      // list of length 3
                                      children: List.generate(
                                        viewModel.serialNoList.length,
                                        (int index) {
                                          return InputChip(
                                            backgroundColor: Colors.blueAccent,
                                            padding: const EdgeInsets.all(8),
                                            label: Text(
                                              viewModel.serialNoList[index],
                                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                            ),
                                            selectedColor: Colors.blueAccent,
                                            deleteIconColor: Colors.white,
                                            onDeleted: () {
                                              viewModel.chipDeletion(index);
                                              setState(() {});
                                            },
                                          );
                                        },
                                      ).toList(),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          viewModel.scanBarCode().then((value) {
                                            final snackbar = SnackBar(
                                              duration: const Duration(seconds: 4),
                                              content: const Text("You have added same BarCode"),
                                              backgroundColor: Colors.black,
                                              action: SnackBarAction(label: "Dismiss", onPressed: () {}),
                                            );
                                            if (viewModel.serialNo == "same") {
                                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                            }
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.add_circle,
                                          color: Colors.blueAccent,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ] else if (viewModel.clickedCardString == "Desktop") ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          PrimaryTextField(
                            controller: _companyTextEditingController,
                            onChanged: (val) {},
                            label: "Company Name",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PrimaryTextField(
                            controller: _modelTextEditingController,
                            onChanged: (val) {
                              viewModel.setModel(val);
                            },
                            errorText: viewModel.modelError,
                            label: "Model",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Number of item :",
                                style: TextStyle(color: Colors.black54, fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Number',
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ] else if (viewModel.clickedCardString == "Mouse") ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          PrimaryTextField(
                            controller: _companyTextEditingController,
                            onChanged: (val) {},
                            label: "Company Name",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PrimaryTextField(
                            controller: _modelTextEditingController,
                            onChanged: (val) {
                              viewModel.setModel(val);
                            },
                            errorText: viewModel.modelError,
                            label: "Model",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Number of item :",
                                style: TextStyle(color: Colors.black54, fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Number',
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ] else if (viewModel.clickedCardString == "Headphone") ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          PrimaryTextField(
                            controller: _companyTextEditingController,
                            onChanged: (val) {},
                            label: "Company Name",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PrimaryTextField(
                            controller: _modelTextEditingController,
                            onChanged: (val) {
                              viewModel.setModel(val);
                            },
                            errorText: viewModel.modelError,
                            label: "Model",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Number of item :",
                                style: TextStyle(color: Colors.black54, fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Number',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Lottie.asset(
                              "assets/jsons/selection_lottie.json",
                              fit: BoxFit.cover,
                              animate: true,
                            ),
                            const Text(
                              "Please select product",
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        )),
                  ],
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: viewModel.clickedCardString.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CommonButton(
                                onPressed: viewModel.canSubmit
                                    ? () {
                                        // Navigator.of(context).pushNamed(HomePage.route);
                                        FireBaseService().addLaptop(
                                            "1",
                                            _companyTextEditingController.text,
                                            _modelTextEditingController.text,
                                            _ramTextEditingController.text,
                                            _hDDTextEditingController.text,
                                            _processorTextEditingController.text,
                                            viewModel.serialNoList.length,
                                            viewModel.serialNoList);
                                        Navigator.of(context).pushReplacementNamed(HomePage.route);
                                      }
                                    : null,
                                title: "Add Product",
                                isLoading: viewModel.isSubmitting,
                              ),
                            ],
                          )
                        : null,
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
