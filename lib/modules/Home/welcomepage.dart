import 'package:expense_tracker/layout/home_layout.dart';
import 'package:expense_tracker/modules/Home/home-screen.dart';
import 'package:flutter/material.dart';

import 'h_screen.dart';

class FWidget extends StatefulWidget {
  const FWidget({super.key});

  @override
  State<FWidget> createState() => _FWidgetState();
}

class _FWidgetState extends State<FWidget> {
  var c1 = Color.fromRGBO(0, 71, 147, 1);
  var Controller1 = TextEditingController();
  var Controller2 = TextEditingController();
  var Controller3 = TextEditingController();
  String? name;
  var salary;
  var saving ; //

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(22, 48, 200, 180),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: c1,
                    fontSize: 32,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 5, 30, 0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: c1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Your Name",
                    labelStyle: TextStyle(fontSize: 16, color: c1),
                    hintText: "First Name",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: c1,
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  controller: Controller1,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 5, 30, 0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: c1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Your income",
                    labelStyle: TextStyle(
                        fontSize: 16, color: c1), //xrgba(0, 71, 147, 1)
                    hintText: "Enter your income",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: c1,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  controller: Controller2,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 5, 30, 0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: c1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Do you want to start saving?",
                    labelStyle: TextStyle(
                        fontSize: 16, color: c1), //xrgba(0, 71, 147, 1)
                    hintText: "Enter the amount",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: c1,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  controller: Controller3,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.fromLTRB(115, 15, 115, 15)),
                    backgroundColor: MaterialStatePropertyAll(c1),
                  ),
                  child: Text(
                    "Start",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      name = Controller1.text;
                      salary = Controller2.text;
                      saving = Controller3.text;

                      final saveImpty = "0";
                      var i1 = double.parse(salary);
                      var i2 = saving.isEmpty ?  double.parse(saveImpty) :double.parse(saving) ;
                      var totalSalary = i1 - i2;
                      var totalAll = totalSalary.toString();
                      var saveOrnot = saving.isEmpty ?  "0.0" : saving ;
                      var router = new MaterialPageRoute(builder: (BuildContext context) => HomeLayout(salary: totalAll, saving: saveOrnot,));
                      Navigator.of(context).push(router);

                    });

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
