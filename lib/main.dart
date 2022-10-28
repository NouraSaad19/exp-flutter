import 'package:expense_tracker/layout/home_layout.dart';
//import 'package:expense_tracker/modules/Home/home-screen.dart';
import 'package:expense_tracker/modules/Home/welcomepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FWidget());
  }
}
