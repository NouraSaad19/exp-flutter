import 'package:expense_tracker/modules/Home/goals_page.dart';
import 'package:expense_tracker/modules/Home/top_new_card.dart';
import 'package:expense_tracker/modules/Home/transaction.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/ui/component/expensesItem.dart';
import '../../data/model/exoenses_model.dart';
import 'goal.dart';
import 'package:expense_tracker/modules/Home/goals_page.dart';

class HomeScreen extends StatefulWidget {
  String? name;
  final String salary;
  final String saving;

  HomeScreen({super.key, required this.salary, required this.saving});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double? s = double.tryParse(widget.salary);
    return Column(
      children: [
        TopNewCard(
          balance: widget.salary,
          saving: widget.saving,
          spent: '\5555 SR',
        ),
        SizedBox(
          height: 25,
        ),
        Container(
            child: Text(
          "My GOAL",
          style: TextStyle(
            fontSize: 25,
          ),
        )),
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            height: 90,
            width: 310,
            child: MyGoal(
                goalName: GoalName,
                saving_amount: saving_amount,
                monthly_amount: monthly_amount),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Recent Expenses",
              style: TextStyle(fontSize: 25),
            ),
            Text("view all"),
          ],
        )),
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),

                  Expanded(
                      child: Container(
                    height: 68,
                    width: 310,
                    child: Center(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: addtypeExpenses.length,
                                itemBuilder: (context, index) {
                                  SizedBox(height: 8);
                                  return MyTranaction(
                                      //icons: "${addiconExpenses[index]}",
                                      tranactionName:
                                          "${addtypeExpenses[index]}",
                                      money: "${addamountExpenses[index]}",
                                      expenseOrIncome: "expense");
                                }),
                          )
                        ],
                      ),
                    ),
                  ))
                  // MyTranaction(tranactionName: "Teaching", money: "300", expenseOrIncome: "income")
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
