import 'package:flutter/material.dart';
import 'package:expense_tracker/ui/component/expensesItem.dart';

import '../../data/model/exoenses_model.dart';

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
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        child: Container(
          padding: EdgeInsets.all(10),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color.fromRGBO(217, 227, 239, 1),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon(
                //   Icons.attach_money,
                //   color: Color.fromRGBO(0, 71, 147, 1),
                // ),
                // Icon(
                //  IconData.parse(expenseOrIncome),
                // ),
                Text(
                  tranactionName,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 71, 147, 1), fontSize: 12),
                ),
                Text(
                  money + "رس",
                  style: TextStyle(
                      color: (expenseOrIncome == 'expense'
                          ? Colors.red
                          : Colors.green)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
