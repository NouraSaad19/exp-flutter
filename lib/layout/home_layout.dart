import 'package:flutter/material.dart';
import 'package:expense_tracker/modules/Home/home-screen.dart';
import 'package:expense_tracker/modules/Profile/profile-screen.dart';
import 'package:expense_tracker/modules/charts/charts-screen.dart';
import 'package:expense_tracker/ui/screens/expenses_screen.dart';

class HomeLayout extends StatefulWidget {
  final String name;
  final String salary;
  final String saving;
  HomeLayout({super.key, required this.salary, required this.saving , required this.name});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      ("hello ${widget.name}"),
      "My Expenses",
      "Profile page",
    ];
    List<Widget> screens = [
      HomeScreen(salary: widget.salary, saving: widget.saving ),
      ExpensesScreen(),
      ProfileScreen(),
    ];
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
