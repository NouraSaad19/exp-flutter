import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:expense_tracker/ui/component/expensesItem.dart';
import 'package:expense_tracker/ui/component/expensesItem.dart';

// var a1 = addtypeExpenses.map((e) => e);
// var a2 = addamountExpenses.map((e) => e);

var a1 = addtypeExpenses.reduce((value, element) => element);
var a2 = addamountExpenses.reduce((value, element) => element);

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  late List<GDPData> _chartData;
  @override
  void initState() {
    _chartData = getChartData(GDPData(a1, a2));
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
  List<GDPData> chartData = [GDPData(a1, a2)];
  return chartData;
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
}
