import 'package:expensive_app_2/bargraph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Mybargraph extends StatelessWidget {
  final double maxy;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;

  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  Mybargraph({
    required this.maxy,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
  });

  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
        sunAmount: sunAmount,
        monAmount: monAmount,
        tueAmount: tueAmount,
        wedAmount: wedAmount,
        thuAmount: thuAmount,
        friAmount: friAmount,
        satAmount: satAmount);
    barData.initailization();
    return BarChart(BarChartData(
        minY: 0,
        maxY: maxy,
        barGroups: barData.bardata
            .map(
              (e) => BarChartGroupData(
                  x: e.x, barRods: [BarChartRodData(toY: e.y)]),
            )
            .toList()));
  }
}
