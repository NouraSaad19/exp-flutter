import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyGoal extends StatelessWidget {
  final String goalName;
  final num saving_amount;
  final num monthly_amount;

  const MyGoal(
      {Key? key,
      required this.goalName,
      required this.monthly_amount,
      required this.saving_amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    num s = saving_amount;
    num m = monthly_amount;
    num p = m / s;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        color: Colors.blue[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //  Icon(Icons.emoji_flags),
                Text(
                  "  ${goalName}",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "+${p * 100} %",
                  style: new TextStyle(
                      fontSize: 12.0, color: Color.fromRGBO(0, 71, 147, 1)),
                ),
                //  Text("16%"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //   Icon(Icons.arrow_upward),

                new LinearPercentIndicator(
                  width: 200.0,
                  lineHeight: 10.0,
                  // center: Text(
                  //   "${p*100} %",
                  //   style: new TextStyle(fontSize: 12.0, color: Colors.white),
                  // ),
                  //  linearStrokeCap: LinearStrokeCap.roundAll,
                  barRadius: const Radius.circular(16),
                  percent: p.toDouble(),
                  backgroundColor: Colors.grey,
                  progressColor: Color.fromRGBO(0, 71, 147, 1),
                ),

                // Column(
                //   children: [
                //     Text("saving"),
                //     Text(
                //       "${saving_amount}",
                //       style: TextStyle(color: Colors.green, fontSize: 20),
                //     ),
                //   ],
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("\t \t Total ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "${saving_amount}",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(0, 71, 147, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}