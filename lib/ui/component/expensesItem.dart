import 'package:expense_tracker/modules/charts/charts-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/model/exoenses_model.dart';

List addtypeExpenses = [];
List addiconExpenses = [];
List addamountExpenses = [];
dynamic? amount;

class ExpensesItem extends StatefulWidget {
  ExpensesItem({required this.expenses});
  final Expenses expenses;

  @override
  State<StatefulWidget> createState() => _ExpensesItemState();
}

class _ExpensesItemState extends State<ExpensesItem> {
  var Controller1 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void dispose() {
    Controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool _validate = false;
    return Container(
      padding: EdgeInsets.all(16),
      color: Color.fromARGB(248, 248, 248, 248),
      child: GridTile(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                widget.expenses.icon!,
                //color: Color.fromRGBO(0, 71, 147, 1),
                color: widget.expenses.color!,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${widget.expenses.typeExpenses}",
                style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(0, 71, 147, 1),
                    fontWeight: FontWeight.w600),
                //textAlign: TextAlign.center,
              ),
            ],
          ),
          footer: Container(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      widget.expenses.icon!,
                                      //color: Color.fromRGBO(0, 71, 147, 1),
                                      color: widget.expenses.color!,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "${widget.expenses.typeExpenses}",
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 71, 147, 1)),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                                content: Form(
                                  key: _formKey,
                                  child: TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    controller: Controller1,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9.]"))
                                    ],
                                    decoration: InputDecoration(
                                      errorText: _validate
                                          ? 'Value Can\'t Be lsee than 0'
                                          : null,
                                      border: OutlineInputBorder(),
                                      hintText: 'ادخل المبلغ',
                                    ),
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
                                                  Color.fromRGBO(
                                                      0, 71, 147, 1)),
                                        ),
                                        onPressed: () {
                                          amount = Controller1.text;
                                          // if (double.parse(amount) >= 0) {
                                          setState(() {
                                            (double.parse(Controller1.text) <=
                                                    0)
                                                ? 0
                                                : widget.expenses.amount =
                                                    double.parse(amount);
                                          });

                                          // widget.expenses.amount =
                                          //     double.parse(amount);
                                          // print(amount);
                                          if (widget.expenses.amount != null) {
                                            addtypeExpenses.add(
                                                widget.expenses.typeExpenses);
                                            addiconExpenses
                                                .add(widget.expenses.icon);
                                            addamountExpenses
                                                .add(widget.expenses.amount);
                                            ch1.add(
                                                widget.expenses.typeExpenses);
                                            ch2.add(widget.expenses.amount);
                                          }
                                          // addamountExpenses
                                          //     .add(widget.expenses.amount);
                                          print(addtypeExpenses);
                                          print(addiconExpenses);
                                          print(addamountExpenses);

                                          print(
                                              "expenses.amount ${widget.expenses.amount}");
                                          Navigator.of(context).pop();
                                          //   Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context) => const HomeScreen()),
                                          // );
                                          // }
                                        },
                                        child: Text("حفظ")),
                                  ),
                                ],
                              ));
                    },
                    icon: Icon(Icons.add)),
                Text(
                    style: TextStyle(
                        color: Color.fromRGBO(0, 71, 147, 1), height: 2.3),
                    ("${widget.expenses.amount}" == "null")
                        ? ""
                        : "${(widget.expenses.amount)?.toStringAsFixed(2)} ر.س"),
              ],
            ),
          )),
    );
  }
}
