import 'package:expense_tracker/layout/home_layout.dart';
import 'package:expense_tracker/modules/Home/home-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../data/model/dataUser.dart';
import '../../database.dart';
import '../../sqldb.dart';
import 'h_screen.dart';

class FWidget extends StatefulWidget {
  const FWidget({super.key});

  @override
  State<FWidget> createState() => _FWidgetState();
}

SqlDb sqldb = SqlDb();

class _FWidgetState extends State<FWidget> {
  var c1 = Color.fromRGBO(0, 71, 147, 1);
  var Controller1 = TextEditingController();
  var Controller2 = TextEditingController();
  var Controller3 = TextEditingController();
  String? name;
  var salary;
  var saving;

  SqlDb sqldb = SqlDb();

  Future<void> totalEpenses() async {
    name = Controller1.text;
    salary = Controller2.text;
    saving = Controller3.text;

    double saveImpty = 0.0;

    double? salaryToDouble = double.tryParse(salary);
    double? saveToDouble = double.tryParse(saving);
    var i2 = saving.isEmpty ? saveImpty : double.parse(saving);
    var totalSalary = salaryToDouble! - i2;
    //---------------------------------------
    String RandomSalaryString = totalSalary.toStringAsFixed(2);
    var converRandomDouble = double.parse(RandomSalaryString);

    //-----------------------
    int response = await sqldb.insertData('''
        INSERT INTO 'databalance' (`nameUser` ,`balance` ,`save`)
        VALUES ( '${name}','${converRandomDouble}' , '${i2}') ''');
    print("response c ====================================");
    print("card $response");

    //----------------------------
    var result1;
    double? converts1 = 0.0;
    Future<double?> getTotal1() async {
      result1 = await sqldb.readData("SELECT SUM(balance) FROM databalance ");

      setState(() {
        String resultBefore = result1.toString();
        String resultBeforeCut = resultBefore.substring(
            resultBefore.indexOf(':') + 2, resultBefore.indexOf('}'));
        converts1 = double.parse(resultBeforeCut);
      });

      return converts1;
    }

    print("============converts1");
    print(converts1);
    double bImpty = 0.0;
    var i3 = converts1 == null ? bImpty : totalSalary;
    converts1 == null ? 0 : converts1;

//
    getTotal1();
    //------------------------------------------------------------
    var resultSave;
    double? convertsSave = 0.0;
    Future<double?> getTotalSave() async {
      resultSave = await sqldb.readData("SELECT SUM(save) FROM databalance ");
      //print(sqldb.toString());
      setState(() {
        String resultBefore = resultSave.toString();
        String resultBeforeCut = resultBefore.substring(
            resultBefore.indexOf(':') + 2, resultBefore.indexOf('}'));
        convertsSave = double.parse(resultBeforeCut);
      });

      return convertsSave;
    }

    print("nnnnn");
    double sImpty = 0.0;
    var checkNull = convertsSave == null ? sImpty : saveToDouble;
    convertsSave == null ? 0 : convertsSave;
    getTotalSave();

    //----------------------------------

    var router = new MaterialPageRoute(
        builder: (BuildContext context) => HomeLayout(
              salary: converts1!,
              saving: convertsSave!,
              name: Controller1.text,
            ));
    Navigator.of(context).push(router);
  }

  //

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _forkey = GlobalKey();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Form(
            key: _forkey,
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 97, right: 42, left: 276),
                    child: Text(
                      "مرحبا",
                      style: TextStyle(
                          color: c1, fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(216, 40, 45, 0),
                    alignment: Alignment.topRight,
                    // margin: EdgeInsets.only(top: 216, right: 45),
                    child: Text(
                      "الاسم",
                      style: TextStyle(
                        color: c1,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 38,
                    width: 360,
                    margin: EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        // labelText: "اكتب اسمك",

                        labelStyle: TextStyle(fontSize: 16, color: c1),
                        hintText: "اكتب اسمك",
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      controller: Controller1,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.fromLTRB(216, 8, 45, 0),
                    child: Text(
                      "الدخل",
                      style: TextStyle(
                        color: c1,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 38,
                    width: 360,
                    margin: EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " ادخل ....";
                          // print(double.parse(value));
                        } else if (double.parse(value) <= 0) {
                          return "you must enter more than 0";
                        }
                        // else if (double.parse(value!) <  0 ) {
                        //   return "Plese Enter Income....!";
                        // }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        //
                        // labelText: "Your income",
                        labelStyle: TextStyle(
                          fontSize: 16,
                        ), //xrgba(0, 71, 147, 1)
                        hintText: "ادخل مقدار دخلك",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      controller: Controller2,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.fromLTRB(21, 8, 45, 0),
                    child: Text(
                      "ابدأ الادخار للمستقبل",
                      style: TextStyle(
                        color: c1,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 38,
                    width: 360,
                    margin: EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // labelText: "Do you want to start saving?",
                        labelStyle: TextStyle(
                            fontSize: 16, color: c1), //xrgba(0, 71, 147, 1)
                        hintText: "ادخل كمبة الادخار الذي تريده (اختياري)",

                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[1-9][0-9]*'))
                      ],
                      controller: Controller3,
                    ),
                  ),
                  SizedBox(
                    height: 5,
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
                          "ابدأ",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          if (_forkey.currentState!.validate()) {
                            return setState(() {
                              totalEpenses();
                            });
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
