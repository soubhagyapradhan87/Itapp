import 'package:flutter/material.dart';
import 'package:sidgs_it_app/modules/dashboard/home_page/view/home_page_view.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  HomePage.route: (_) => const HomePage(),

};
