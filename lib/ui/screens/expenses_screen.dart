import 'package:flutter/material.dart';

import '../../data/model/exoenses_model.dart';
import '../widget/expenses_card.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

final List<Expenses> expensesItems = [
  Expenses(
      id: 1,
      typeExpenses: "تسوق",
      icon: Icons.shopping_cart,
      color: Color.fromRGBO(0, 71, 147, 1)),
  Expenses(
      id: 2,
      typeExpenses: "المطاعم",
      icon: Icons.restaurant,
      color: Color.fromARGB(255, 216, 165, 12)),
  Expenses(
      id: 3,
      typeExpenses: "الصحة",
      icon: Icons.health_and_safety_outlined,
      color: Color.fromARGB(255, 147, 0, 10)),
  Expenses(
      id: 4,
      typeExpenses: "العائلة والاصدقاء",
      icon: Icons.family_restroom,
      color: Color.fromRGBO(0, 71, 147, 1)),
  Expenses(
      id: 5,
      typeExpenses: "الاستثمار",
      icon: Icons.money_sharp,
      color: Color.fromRGBO(97, 54, 54, 1)),
  Expenses(
    id: 6,
    typeExpenses: "سفر",
    icon: Icons.local_airport,
    color: Color.fromRGBO(0, 71, 147, 1),
  ),
  Expenses(
      id: 7,
      typeExpenses: "التعليم",
      icon: Icons.cast_for_education_rounded,
      color: Color.fromRGBO(0, 71, 147, 1)),
  Expenses(
      id: 8,
      typeExpenses: "الترفية",
      icon: Icons.sports_esports,
      color: Color.fromARGB(255, 147, 0, 10)),
  Expenses(
      id: 9,
      typeExpenses: "النادي",
      icon: Icons.sports_cricket,
      color: Color.fromARGB(255, 8, 140, 67)),
  Expenses(
      id: 10,
      typeExpenses: "اخرى",
      icon: Icons.add_card,
      color: Color.fromARGB(255, 216, 165, 12)),
];

class _ExpensesScreenState extends State<ExpensesScreen> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 234, 234),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Color.fromRGBO(0, 71, 147, 1),
            onPressed: (() {
              setState(() {
                Navigator.of(context).pop();
              });
            }),
          ),
          backgroundColor: Color.fromARGB(248, 248, 248, 248),
          title: Text("المصروفات",
              style: TextStyle(color: Color.fromRGBO(0, 71, 147, 1))),
        ),
        body: Container(
          child: ExpensesCard(
            expenses: expensesItems,
          ),
        ),
      );
}
