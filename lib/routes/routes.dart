import 'package:flutter/material.dart';
import 'package:sidgs_it_app/modules/dashboard/Add_employee_page/view/add_employee_page.dart';
import 'package:sidgs_it_app/modules/dashboard/accessories_page/view/accessories_page_view.dart';
import 'package:sidgs_it_app/modules/dashboard/add_products_page/view/add_products_page_view.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_details_page_view.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_list_page/view/employee_list_page.dart';
import 'package:sidgs_it_app/modules/dashboard/home_page/view/home_page_view.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  HomePage.route: (_) => const HomePage(),
  AddProductsPage.route: (_) => const AddProductsPage(),
  EmployeeDetailsPage.route: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final document = args['document'];
    return EmployeeDetailsPage(
      document: document,
    );
  },
  AddEmployeePage.route: (_) => const AddEmployeePage(),
  EmployeeListPage.route: (_) => const EmployeeListPage(),
  AccessoriesPage.route: (_) => const AccessoriesPage()
};
