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

  double amountSpent = 0.0;
  var salaryString;
  var totalAllSalary;
  var totalAllString;
  void CalcluteSum() {
    for (var item in addamountExpenses) {
      amountSpent += item;
    }

    salaryString = double.parse(salary);

    totalAllSalary = salaryString - amountSpent;
    totalAllSalary = totalAllSalary - monthly_amount;
    totalAllString = totalAllSalary.toString();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    widget.CalcluteSum();
    return Column(
      children: [
        Container(
          child: TopNewCard(
            balance: "${(widget.totalAllSalary).toStringAsFixed(2)}",
            saving: widget.saving,
            spent: "${(widget.amountSpent).toStringAsFixed(2)}",
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Text("\t \t\t\t\t اهدافي ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 90,
          width: 336,
          child: MyGoal(
              goalName: GoalName,
              saving_amount: saving_amount,
              monthly_amount: monthly_amount),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(left: 100),
              child: Text(
                "المصروفات الاخيرة",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "عرض الكل",
              style: TextStyle(color: Color.fromRGBO(0, 71, 147, 1)),
            ),
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
                                      money:
                                          "${(addamountExpenses[index]).toStringAsFixed(2)}\t\t\t",
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
