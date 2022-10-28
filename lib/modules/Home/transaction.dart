import 'package:flutter/material.dart';
import 'package:expense_tracker/ui/component/expensesItem.dart';

class MyTranaction extends StatelessWidget {
  final String tranactionName;
  final String money;
  final String expenseOrIncome;

  MyTranaction({
    Key? key,
    required this.tranactionName,
    required this.money,
    required this.expenseOrIncome,
    //required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 50,
        color: Color.fromRGBO(0, 71, 147, 200),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.attach_money),
              Text(
                tranactionName,
                style: TextStyle(
                    color: Color.fromRGBO(0, 71, 147, 1), fontSize: 12),
              ),
              Text(
                (expenseOrIncome == "expense" ? "-" : "+") + money + "SR",
                style: TextStyle(
                    color: (expenseOrIncome == 'expense'
                        ? Colors.red
                        : Colors.green)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
