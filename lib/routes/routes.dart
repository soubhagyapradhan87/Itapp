import 'package:flutter/material.dart';
import 'package:sidgs_it_app/modules/dashboard/Add_employee_page/view/add_employee_page.dart';
import 'package:sidgs_it_app/modules/dashboard/add_products_page/view/add_products_page_view.dart';
import 'package:sidgs_it_app/modules/dashboard/employee_details_page/view/employee_details_page_view.dart';
import 'package:sidgs_it_app/modules/dashboard/home_page/view/home_page_view.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  HomePage.route: (_) => const HomePage(),
  AddProductsPage.route: (_) => const AddProductsPage(),
  EmployeeDetailsPage.route: (_) => const EmployeeDetailsPage(),
  AddEmployeePage.route: (_) => const AddEmployeePage(),

};
