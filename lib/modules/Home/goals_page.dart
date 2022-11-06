import 'dart:ui';
import 'package:expense_tracker/layout/home_layout.dart';
import 'package:intl/intl.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
// import 'DatePicker/custom_calendar.dart';
// import 'DatePicker/custom_date_range_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'h_screen.dart';

class MyGoals extends StatefulWidget {
  const MyGoals({super.key});

  @override
  State<MyGoals> createState() => _MyGoalsState();
}

var myController1 = TextEditingController();
String GoalName = '';

var myController2 = TextEditingController();
double saving_amount = 0.0;

var myController3 = TextEditingController();
double monthly_amount = 0.0;

class _MyGoalsState extends State<MyGoals> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: Text(
          'الاهداف ',
          style: TextStyle(
              // fontSize: 15,
              color: Color.fromRGBO(0, 71, 147, 1),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        //alignment: Alignment.topRight,
        padding: EdgeInsets.all(35),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // arabic format
              children: [
                Text(
                  "عنوان الهدف",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(0, 71, 147, 1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 38,
                  // width: 306,
                  child: TextField(
                    controller: myController1,
                    textAlign: TextAlign.start,
                    showCursor: false,
                    style: TextStyle(height: 2.5),
                    decoration: InputDecoration(
                      //  filled: true,
                      fillColor: Color.fromRGBO(217, 227, 239, 1),
                      border: OutlineInputBorder(),
                      hintText: 'ادخل هدفك ',
                    ),
                    onChanged: (text) {
                      GoalName = text;
                    },
                  ),
                ),

                SizedBox(height: 10),
//////////////////

                ///
                Text(
                  'اختر التاريخ ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(0, 71, 147, 1),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Container(
                    alignment: Alignment.center,
                    // color: Colors.amberAccent,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            showCustomDateRangePicker(
                              context,
                              dismissible: true,
                              minimumDate: DateTime.now(),
                              maximumDate:
                                  DateTime.now().add(const Duration(days: 200)),
                              endDate: endDate,
                              startDate: startDate,
                              onApplyClick: (start, end) {
                                setState(() {
                                  endDate = end;
                                  startDate = start;
                                });
                              },
                              onCancelClick: () {
                                setState(() {
                                  endDate = null;
                                  startDate = null;
                                });
                              },
                            );
                          },
                          // tooltip: 'choose date Rangellll',
                          child: Icon(Icons.calendar_month,
                              color: Color.fromRGBO(0, 71, 147, 1)),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${startDate != null ? DateFormat("dd, MMM").format(startDate!) : '-'} / ${endDate != null ? DateFormat("dd, MMM").format(endDate!) : '-'}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color.fromRGBO(0, 71, 147, 1),
                          ),
                        ),
                      ],
                    )),
/////////////////
                SizedBox(height: 10),

                Text(
                  "كمية الادخار ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(0, 71, 147, 1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(
                  height: 38,
                  child: TextField(
                    controller: myController2,
                    textAlign: TextAlign.start,
                    showCursor: false,
                    style: TextStyle(height: 2.5),
                    decoration: InputDecoration(
                      // filled: true,
                      fillColor: Color.fromRGBO(217, 227, 239, 1),
                      border: OutlineInputBorder(),
                      hintText: 'ادخل المبلغ',
                    ),
                    onChanged: (text) {
                      saving_amount = double.parse(text);
                    },
                  ),
                ),

                SizedBox(height: 10),
                Text(
                  "الخصم الشهري",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(0, 71, 147, 1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(
                  height: 38,
                  child: TextField(
                    controller: myController3,
                    textAlign: TextAlign.start,
                    showCursor: false,
                    style: TextStyle(height: 2.5),
                    decoration: InputDecoration(
                      //   filled: true,
                      fillColor: Color.fromRGBO(217, 227, 239, 1),
                      border: OutlineInputBorder(),
                      hintText: 'ادخل المبلغ',
                    ),
                    onChanged: (text) {
                      monthly_amount = double.parse(text);
                    },
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  "ملاحظات",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(0, 71, 147, 1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(
                  height: 73,
                  child: TextField(
                    textAlign: TextAlign.start,
                    showCursor: false,
                    style: TextStyle(height: 3),
                    decoration: InputDecoration(
                      hintText: 'ادخل ملاحظاتك هنا ',
                      //filled: true,
                      fillColor: Color.fromRGBO(217, 227, 239, 1),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(0, 71, 147, 1),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    Navigator.pop(context);

                    // setState(() {
                    //   print(myController1.text);
                    //   print(myController2.text);
                    //   print(myController3.text);
                    // });
                  },
                  child: Text(
                    'حفظ',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
