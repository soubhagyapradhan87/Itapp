import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sidgs_it_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


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






