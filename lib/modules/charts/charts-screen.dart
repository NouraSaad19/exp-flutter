import 'dart:ffi';
import 'dart:math';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:expense_tracker/ui/component/expensesItem.dart';
import 'package:expense_tracker/ui/component/expensesItem.dart';
import 'package:flutter/src/rendering/box.dart';

List ch1 = [];
List ch2 = [];

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  late List<GDPData> _chartData;
  @override
  void initState() {
    _chartData = getChartData(GDPData("", 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> colorCodes = <String>[
      "#004793",
      "#2FC8D0",
      "#FFC107",
      "#001933",
      "#704494",
      "#945044",
      "#44946c",
      "#942c2c",
      "#abd9db",
      "#8f91ff",
      "#242b25",
      "#2b2427",
      "#292b24",
      "#24272b",
      "#632744",
      "#7b44fc",
      "#0ee9ed",
      "#0eed33",
      "#ed9f0e",
      "#072326",
    ];
    return Column(
      children: [
        Container(
          child: SfCircularChart(
            palette: <Color>[
              HexColor("#004793"),
              HexColor("#2FC8D0"),
              HexColor("#FFC107"),
              HexColor("#001933"),
              HexColor("#704494"),
              HexColor("#945044"),
              HexColor("#44946c"),
              HexColor("#942c2c"),
              HexColor("#abd9db"),
              HexColor("#8f91ff"),
              HexColor("#242b25"),
              HexColor("2b2427"),
              HexColor("292b24"),
              HexColor("24272b"),
              HexColor("#632744"),
              HexColor("#7b44fc"),
              HexColor("#0ee9ed"),
              HexColor("#0eed33"),
              HexColor("#ed9f0e"),
              HexColor("#072326")
            ],
            title: ChartTitle(
                text: "المصروفات",
                textStyle: TextStyle(
                    color: Color.fromRGBO(0, 71, 147, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 20)),
            legend: Legend(
                isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            series: <CircularSeries>[
              DoughnutSeries<GDPData, String>(
                dataSource: _chartData,
                xValueMapper: (GDPData data, _) => data.continent,
                yValueMapper: (GDPData data, _) => data.gdp,
                innerRadius: '65%',
                dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.outside),
              ),
            ],
          ),
        ),
        Text(
          "يوضح الرسم البياني مصروفاتك خلال هذا الشهر",
          style: TextStyle(color: HexColor("#9C9FA1"), fontSize: 12),
        ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: ch1.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  Card(
                    color: HexColor("#D9E3EF"),

                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    shadowColor: Color.fromRGBO(0, 71, 147, 1),
                    // clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 340,
                          height: 67,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipPath(
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color:
                                                  HexColor(colorCodes[index]),
                                              width: 13))),
                                ),
                                clipper: ShapeBorderClipper(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(3))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      ch1[index],
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        color: HexColor("#004793"),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "${ch2[index]} ر.س ",
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]);
              }),
        ),
      ],
    );
  }
}

List<GDPData> getChartData(GDPData gdpData) {
  List<GDPData> chartData = [];

  for (int i = 0; i < ch1.length; i++) {
    chartData.add(GDPData(ch1[i], ch2[i]));
  }
  return chartData;
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
}
