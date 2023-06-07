import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sidgs_it_app/modules/common/component/common_button.dart';
import 'package:sidgs_it_app/modules/dashboard/add_products_page/view/add_products_page_view.dart';
import 'package:sidgs_it_app/modules/dashboard/home_page/view/employee_section_component.dart';
import 'package:sidgs_it_app/modules/dashboard/home_page/view/home_page_app_bar.dart';
import 'package:sidgs_it_app/modules/dashboard/home_page/view/item_stock_card.dart';
import 'package:sidgs_it_app/modules/dashboard/home_page/view_model/home_page_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return HomePageViewModel();
      },
      child: const HomePageScaffold(),
    );
  }
}

class HomePageScaffold extends StatefulWidget {
  const HomePageScaffold({super.key});

  @override
  State<HomePageScaffold> createState() => _HomePageScaffoldState();
}

class _HomePageScaffoldState extends State<HomePageScaffold> {
  HomePageViewModel get viewModel => context.read<HomePageViewModel>();


  @override
  void dispose() {
    viewModel.cancelSubscription();
    print("subscription cancel");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Observer(
              builder:(context){
                return SingleChildScrollView(
                  child: Column(children: [
                    const HomePageAppBar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomePageCard(
                                itemName: "Laptop",
                                availableStock: viewModel.count,
                                icon: Icons.laptop_mac,
                              ),
                              HomePageCard(
                                itemName: "Monitor",
                                availableStock: 12,
                                icon: Icons.monitor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomePageCard(
                                itemName: "Mouse",
                                availableStock: 200,
                                icon: Icons.mouse_outlined,
                              ),
                              HomePageCard(
                                itemName: "HeadPhone",
                                availableStock: 250,
                                icon: Icons.headphones,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CommonButton(
                                  onPressed: () => Navigator.of(context).pushNamed(AddProductsPage.route),
                                  title: "Add Product",
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Employee Section:",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    EmployeeSectionComponent()
                  ]),
                );
              }
            )));
  }
}
