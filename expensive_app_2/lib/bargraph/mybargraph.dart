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
        titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getBottomTitles,
              ),
            )),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(
          show: false,
        ),
        minY: 0,
        maxY: maxy,
        barGroups: barData.bardata.map((e) {
          return BarChartGroupData(x: e.x, barRods: [
            BarChartRodData(
                toY: e.y,
                color: Color.fromARGB(255, 112, 218, 107),
                width: 20,
                borderRadius: BorderRadius.circular(5),
                backDrawRodData: BackgroundBarChartRodData(
                    toY: maxy, show: true, color: Colors.white))
          ]);
        }).toList()));
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    const TextStyle style =
        TextStyle(fontWeight: FontWeight.w600, color: Colors.grey);
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(
          'S',
          style: style,
        );
        break;
      case 1:
        text = Text(
          'M',
          style: style,
        );
        break;
      case 2:
        text = Text(
          'T',
          style: style,
        );
        break;
      case 3:
        text = Text(
          'W',
          style: style,
        );
        break;
      case 4:
        text = Text(
          'T',
          style: style,
        );
        break;
      case 5:
        text = Text(
          'F',
          style: style,
        );
        break;
      case 6:
        text = Text(
          'S',
          style: style,
        );
        break;

      default:
        text = Text(
          '',
          style: style,
        );
    }
    return SideTitleWidget(child: text, axisSide: meta.axisSide);
  }
}
