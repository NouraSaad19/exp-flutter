import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:expense_tracker/ui/component/expensesItem.dart';
import 'package:expense_tracker/ui/component/expensesItem.dart';

dynamic a1 = addtypeExpenses.map((e) => e).toList();
dynamic a2 = addamountExpenses.map((e) => e).toList();

// var a1 = addtypeExpenses.reduce((value, element) => element);
// var aa1 = addtypeExpenses.reduce((value, element) => element);
// var a2 = addamountExpenses.reduce((value, element) => element);
// var aa2 = addamountExpenses.reduce((value, element) => element);

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  late List<GDPData> _chartData;
  @override
  void initState() {
    _chartData = getChartData(GDPData(a1[0], a2[0]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCircularChart(
        title: ChartTitle(text: "Expence"),
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        series: <CircularSeries>[
          DoughnutSeries<GDPData, String>(
            dataSource: _chartData,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.gdp,
            dataLabelSettings: DataLabelSettings(
                isVisible: true, labelPosition: ChartDataLabelPosition.outside),
          ),
        ],
      ),
    );
  }
}

List<GDPData> getChartData(GDPData gdpData) {
  List<GDPData> chartData = [
    GDPData(a1[0], a2[0]),
    GDPData(a1[1], a2[1]),
    // GDPData(a1[2], a2[2]),
    // GDPData(a1[3], a2[3]),
    // GDPData(a1[4], a2[4]),
    // GDPData(a1[5], a2[5]),
    // GDPData(a1[6], a2[6]),
    // GDPData(a1[7], a2[7]),
    // GDPData(a1[8], a2[8]),
    // GDPData(a1[9], a2[9]),
  ];

  return chartData;
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
}
