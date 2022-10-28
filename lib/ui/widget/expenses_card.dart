import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../data/model/exoenses_model.dart';
import '../component/expensesItem.dart';

class ExpensesCard extends StatefulWidget {
  final List<Expenses> expenses;
  const ExpensesCard({Key? key, required this.expenses}) : super(key: key);

  @override
  State<ExpensesCard> createState() => _ExpensesCardState();
}

class _ExpensesCardState extends State<ExpensesCard> {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        padding: const EdgeInsets.all(2),
        controller: controller,
        itemCount: widget.expenses.length,
        itemBuilder: (context, index) {
          final item = widget.expenses[index];
          return expensesItem(item, context);
        },
      ),
    );
  }
}
