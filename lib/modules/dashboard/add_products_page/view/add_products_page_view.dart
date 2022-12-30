import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sidgs_it_app/modules/common/component/common_button.dart';
import 'package:sidgs_it_app/modules/common/component/primary_text_field.dart';
import 'package:sidgs_it_app/modules/dashboard/add_products_page/view/product_card.dart';
import 'package:sidgs_it_app/modules/dashboard/add_products_page/view_model/add_products_view_model.dart';
import 'package:sidgs_it_app/modules/dashboard/home_page/view/home_page_view.dart';

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
  List productList = [
    "Laptop",
    "Desktop",
    "Mouse",
    "Headphone",
  ];
  List productIcons = [Icons.laptop_mac, Icons.monitor, Icons.mouse_outlined, Icons.headphones];

  late final TextEditingController _companyTextEditingController = TextEditingController();
  late final TextEditingController _modelTextEditingController;
  late final TextEditingController _configurationTextEditingController = TextEditingController();

  @override
  void initState() {
    _modelTextEditingController = TextEditingController(text: viewModel.model);
    super.initState();
  }

  AddProductsPageViewModel get viewModel => context.read<AddProductsPageViewModel>();

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
                    child: viewModel.clickedCardString.isNotEmpty?Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Product Details:",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ):null,
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
                          PrimaryTextField(
                            controller: _configurationTextEditingController,
                            onChanged: (val) {},
                            label: "Configuration",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "RAM (in GB) :",
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
                                    hintText: 'RAM',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "HDD (in GB) :",
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
                                    hintText: 'HDD',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Processor :",
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
                                    hintText: 'i3/i5/i7',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
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
                    child: viewModel.clickedCardString.isNotEmpty?Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CommonButton(
                          onPressed: viewModel.canSubmit
                              ? () {
                                  Navigator.of(context).pushNamed(HomePage.route);
                                }
                              : null,
                          title: "Add Product",
                          isLoading: viewModel.isSubmitting,
                        ),
                      ],
                    ):null,
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
