import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sidgs_it_app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
      EasyLocalization(
          supportedLocales: const [
            Locale('en'),
          ],
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          child: const MyApp()
      )
  );
}




