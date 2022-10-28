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
      typeExpenses: "Shopping",
      icon: Icons.shopping_cart,
      color: Color.fromRGBO(0, 71, 147, 1)),
  Expenses(
      id: 2,
      typeExpenses: "Restaurant",
      icon: Icons.restaurant,
      color: Color.fromARGB(255, 216, 165, 12)),
  Expenses(
      id: 3,
      typeExpenses: "Health",
      icon: Icons.health_and_safety_outlined,
      color: Color.fromARGB(255, 147, 0, 10)),
  Expenses(
      id: 4,
      typeExpenses: "Family&Friends",
      icon: Icons.family_restroom,
      color: Color.fromRGBO(0, 71, 147, 1)),
  Expenses(
      id: 5,
      typeExpenses: "Coffe Shope",
      icon: Icons.coffee_outlined,
      color: Color.fromRGBO(97, 54, 54, 1)),
  Expenses(
    id: 6,
    typeExpenses: "Travel",
    icon: Icons.local_airport,
    color: Color.fromRGBO(0, 71, 147, 1),
  ),
  Expenses(
      id: 7,
      typeExpenses: "Education",
      icon: Icons.cast_for_education_rounded,
      color: Color.fromRGBO(0, 71, 147, 1)),
  Expenses(
      id: 8,
      typeExpenses: "Enterainment",
      icon: Icons.sports_esports,
      color: Color.fromARGB(255, 147, 0, 10)),
  Expenses(
      id: 9,
      typeExpenses: "Gym",
      icon: Icons.sports_cricket,
      color: Color.fromARGB(255, 8, 140, 67)),
  Expenses(
      id: 10,
      typeExpenses: "Investment",
      icon: Icons.money_sharp,
      color: Color.fromARGB(255, 216, 165, 12)),
];

class _ExpensesScreenState extends State<ExpensesScreen> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color.fromARGB(49, 187, 183, 183),
        body: Container(
          child: ExpensesCard(
            expenses: expensesItems,
          ),
        ),
      );
}
