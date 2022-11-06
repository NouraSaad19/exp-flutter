import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyGoal extends StatefulWidget {
  final String goalName;
  final double saving_amount;
  final double monthly_amount;

  const MyGoal(
      {Key? key,
      required this.goalName,
      required this.monthly_amount,
      required this.saving_amount})
      : super(key: key);

  @override
  State<MyGoal> createState() => _MyGoalState();
}

class _MyGoalState extends State<MyGoal> {
  @override
  Widget build(BuildContext context) {
    double s = widget.saving_amount;
    double m = widget.monthly_amount;
    double p = m / s;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color.fromRGBO(217, 227, 239, 1),
        ),
        child: (m > 0)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            "  ${widget.goalName}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "% ${(p * 100).toStringAsFixed(1)}+",
                            textAlign: TextAlign.right,
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Color.fromRGBO(0, 71, 147, 1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new LinearPercentIndicator(
                        width: 287.0,
                        lineHeight: 8.0,
                        barRadius: const Radius.circular(16),
                        percent: p.toDouble(),
                        backgroundColor: Colors.grey,
                        progressColor: Color.fromRGBO(0, 71, 147, 1),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text("\t \t الإجمالي ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(0, 71, 147, 1),
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "${widget.saving_amount} ",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(0, 71, 147, 1),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(" لا يوجد هدف!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w100)),
                ],
              ),
      ),
    );
  }
}
