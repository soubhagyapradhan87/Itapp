import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sidgs_it_app/routes/routes.dart';
import 'modules/dashboard/home_page/view/home_page_view.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes,
      initialRoute: HomePage.route,
    );
  }
}