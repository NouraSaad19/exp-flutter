import 'package:expense_tracker/layout/home_layout.dart';
import 'package:expense_tracker/modules/Home/first_screen.dart';
//import 'package:expense_tracker/modules/Home/home-screen.dart';
import 'package:expense_tracker/modules/Home/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/modules/Home/goals_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'modules/Onboarding/on_boarding.dart';

void main() async {
  await Future.delayed(Duration(seconds: 2));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(localizationsDelegates: [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ], supportedLocales: [
      Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
    ], debugShowCheckedModeBanner: false, home: OnBoardingScreen());
  }
}
