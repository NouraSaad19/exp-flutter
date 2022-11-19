import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../sqldb.dart';

class MyGoal extends StatefulWidget {
  final String goalName;
  final double saving_amount;
  final double monthly_amount;

  MyGoal({
    Key? key,
    required this.goalName,
    required this.monthly_amount,
    required this.saving_amount,
  }) : super(key: key);

  @override
  State<MyGoal> createState() => _MyGoalState();
}

class _MyGoalState extends State<MyGoal> {
  SqlDb sqlDb = SqlDb();

  Future<List<Map>> readData() async {
    List<Map> response = await sqlDb.readData(
        "SELECT * FROM goals ORDER BY id DESC LIMIT 1 "); //ORDER BY id DESC LIMIT 1
    //data = jsonDecode(response);
    return response;
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 53,
                child: FutureBuilder(
                  future: readData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Map>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, i) {
                            double s = snapshot.data![i]['saving'];
                            double m = snapshot.data![i]['monthly'];
                            double p = m / s;

                            return Card(
                              shadowColor: Color.fromRGBO(0, 71, 147, 1),
                              elevation: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Color.fromRGBO(217, 227, 239, 1)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "${snapshot.data![i]['goal']}",
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      0, 71, 147, 1),
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
                                                  color: Color.fromRGBO(
                                                      0, 71, 147, 1)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        new LinearPercentIndicator(
                                          width: 287.0,
                                          lineHeight: 8.0,
                                          barRadius: const Radius.circular(16),
                                          percent: p.toDouble(),
                                          backgroundColor: Colors.grey,
                                          progressColor:
                                              Color.fromRGBO(0, 71, 147, 1),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            Text("\t \t الإجمالي ",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromRGBO(
                                                        0, 71, 147, 1),
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "${snapshot.data![i]['saving']}",
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      0, 71, 147, 1),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    return Column(
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
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
