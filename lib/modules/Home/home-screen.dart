import 'package:expense_tracker/modules/Home/goals_page.dart';
import 'package:expense_tracker/modules/Home/top_new_card.dart';
import 'package:expense_tracker/modules/Home/transaction.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/ui/component/expensesItem.dart';
import '../../data/model/exoenses_model.dart';
import '../../sqldb.dart';
import 'goal.dart';
import 'package:expense_tracker/modules/Home/goals_page.dart';

class HomeScreen extends StatefulWidget {
  String? name;
  double salary;
  double saving;

  HomeScreen({super.key, required this.salary, required this.saving});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SqlDb sqldb = SqlDb();
  Future<List<Map>> readData() async {
    List<Map> response = await sqldb.readData("SELECT * FROM expenseess");
    // List<Map> responses = await sqldb.readData("SELECT * FROM dataBalance");
    return response;
  }

  var result;
  double? converts;
  Future<double?> getTotal() async {
    result = await sqldb.readData("SELECT SUM(amounts) FROM expenseess");
    //print(sqldb.toString());
    String resultBefore = result.toString();
    String resultBeforeCut = resultBefore.substring(
        resultBefore.indexOf(':') + 2, resultBefore.indexOf('}'));
    setState(() {
      converts = double.tryParse(resultBeforeCut);
    });
    print(converts);
    return converts;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTotal();
  }

  @override
  Widget build(BuildContext context) {
    double? amountSpent = converts == null ? 0 : converts;
    // print("amountSpent");
    // print(amountSpent);
    // var salaryString;
    var totalAllSalary;

    totalAllSalary = widget.salary - amountSpent!;
    totalAllSalary = totalAllSalary - monthly_amount;
    // totalAllString = totalAllSalary.toString();
    return Column(children: [
      Container(
        child: TopNewCard(
          balance: (totalAllSalary),
          saving: widget.saving,
          spent: (amountSpent),
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
                color: Color.fromRGBO(0, 71, 147, 1),
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
                  color: Color.fromRGBO(0, 71, 147, 1),
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
              child: Column(children: [
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: Container(
                    height: 68,
                    width: 310,
                    child: Center(
                        child: Column(children: [
                      Expanded(
                        child: ListView(
                          children: [
                            FutureBuilder(
                              future: readData(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<Map>> snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        SizedBox(height: 8);
                                        // amountSpent +=
                                        //     (snapshot.data![index]['amounts']);
                                        // print("amountSpent ${amountSpent}");
                                        return MyTranaction(
                                            // after update with sql
                                            tranactionName:
                                                "${snapshot.data![index]['typeExpensess']}",
                                            money:
                                                // "${(addamountExpenses[index]).toStringAsFixed(2)}\t\t\t",
                                                "${(snapshot.data![index]['amounts']).toStringAsFixed(2)}\t\t\t",
                                            expenseOrIncome: "expense");
                                      });
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ]))
                    // MyTranaction(tranactionName: "Teaching", money: "300", expenseOrIncome: "income")
                    ))
          ])),
        ),
      ),
    ]);
  }
}
