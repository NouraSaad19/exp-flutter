import 'package:flutter/material.dart';

import '../../data/model/exoenses_model.dart';

var Controller1 = TextEditingController();

List addtypeExpenses = [];
List addiconExpenses = [];
List addamountExpenses = [];
dynamic? amount;

Widget expensesItem(Expenses expenses, BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16),
    color: Color.fromARGB(248, 248, 248, 248),
    child: GridTile(
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              expenses.icon!,
              //color: Color.fromRGBO(0, 71, 147, 1),
              color: expenses.color!,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "${expenses.typeExpenses}",
              style:
                  TextStyle(fontSize: 15, color: Color.fromRGBO(0, 71, 147, 1)),
              //textAlign: TextAlign.center,
            ),
          ],
        ),
        footer: Container(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    print("you click");
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    expenses.icon!,
                                    //color: Color.fromRGBO(0, 71, 147, 1),
                                    color: expenses.color!,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "${expenses.typeExpenses}",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 71, 147, 1)),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                              content: TextField(
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                controller: Controller1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter amount',
                                ),
                              ),
                              actions: [
                                Container(
                                  //color: Color.fromRGBO(0, 71, 147, 1),
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Color.fromRGBO(0, 71, 147, 1)),
                                      ),
                                      onPressed: () {
                                        amount = Controller1.text;

                                        expenses.amount = double.parse(amount);
                                        print(amount);

                                        addtypeExpenses
                                            .add(expenses.typeExpenses);
                                        addiconExpenses.add(expenses.icon);
                                        addamountExpenses.add(expenses.amount);
                                        print(addtypeExpenses);
                                        print(addiconExpenses);
                                        print(addamountExpenses);
                                        setState() {
                                          expenses.amount = amount;
                                          print('*^&^22222222$amount');
                                        }

                                        print(
                                            "expenses.amount ${expenses.amount}");
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Save")),
                                ),
                              ],
                            ));
                  },
                  icon: Icon(Icons.add)),
              Text(
                  style: TextStyle(color: Color.fromRGBO(0, 71, 147, 1)),
                  ("${expenses.amount}" == "null")
                      ? "0 SAR"
                      : "${expenses.amount}"),
            ],
          ),
        )),
  );
}
