import 'package:expense_tracker/modules/Home/home-screen.dart';
import 'package:expense_tracker/modules/Profile/profile-screen.dart';
import 'package:expense_tracker/ui/screens/expenses_screen.dart';
import 'package:flutter/material.dart';

class HScreen extends StatefulWidget {
  final String? goalName;
  

  const HScreen({super.key, required this.goalName});

  @override
  State<HScreen> createState() => _HScreenState(goalName);
}

class _HScreenState extends State<HScreen> {
  String? goalName;
  _HScreenState(this.goalName);


  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(
      salary: '',
      saving: '',
    ),
    ExpensesScreen(),
    ProfileScreen(),
  ];

  List<String> titles = [
    "Noura",
    "My Expenses",
    "Profile page",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color.fromARGB(255, 249, 247, 247),
        title: Text(
          "${titles[currentIndex]}",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (value) => setState(() {
                currentIndex = value;
              }), //يعلمني انا  قاعده اضغط على ايش
          //ignore: prefer_const_literals_to_create_immutables
          items: [
            // need icon and label
            // ignore: prefer_const_constructors
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color.fromRGBO(0, 71, 147, 1),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add, color: Color.fromRGBO(0, 71, 147, 1)),
                label: 'New'),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_rounded,
                    color: Color.fromRGBO(0, 71, 147, 1)),
                label: 'Dashboard'),
          ]),
    );
  }
}
