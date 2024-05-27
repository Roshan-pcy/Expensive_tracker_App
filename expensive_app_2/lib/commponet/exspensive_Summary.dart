import 'package:expensive_app_2/bargraph/mybargraph.dart';
import 'package:expensive_app_2/data/expense_data.dart';
import 'package:expensive_app_2/datetime/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExspensiveSummary extends StatelessWidget {
  final DateTime startOfweek;
  const ExspensiveSummary({super.key, required this.startOfweek});
  double calculate(
      ExpenseData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday) {
    List<double> maxvlaue = [
      value.calculateDailyExpensiveSumanry()[sunday] ?? 0,
      value.calculateDailyExpensiveSumanry()[monday] ?? 0,
      value.calculateDailyExpensiveSumanry()[wednesday] ?? 0,
      value.calculateDailyExpensiveSumanry()[thursday] ?? 0,
      value.calculateDailyExpensiveSumanry()[friday] ?? 0,
      value.calculateDailyExpensiveSumanry()[saturday] ?? 0,
      value.calculateDailyExpensiveSumanry()[tuesday] ?? 0,
    ];
    maxvlaue.sort();
    double max = maxvlaue.last * 1.1;
    return max == 0 ? 100 : max;
  }

  String calculateTotal(
      ExpenseData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday) {
    List<double> maxvlaue = [
      value.calculateDailyExpensiveSumanry()[sunday] ?? 0,
      value.calculateDailyExpensiveSumanry()[monday] ?? 0,
      value.calculateDailyExpensiveSumanry()[wednesday] ?? 0,
      value.calculateDailyExpensiveSumanry()[thursday] ?? 0,
      value.calculateDailyExpensiveSumanry()[friday] ?? 0,
      value.calculateDailyExpensiveSumanry()[saturday] ?? 0,
      value.calculateDailyExpensiveSumanry()[tuesday] ?? 0,
    ];
    double total = 0;

    for (int i = 0; i < maxvlaue.length; i++) {
      total += maxvlaue[i];
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    String sun = convertDateTimeToStirng(startOfweek.add(Duration(days: 0)));
    print(sun + "value of sunday");
    String mon = convertDateTimeToStirng(startOfweek.add(Duration(days: 1)));
    String tue = convertDateTimeToStirng(startOfweek.add(Duration(days: 2)));
    String wed = convertDateTimeToStirng(startOfweek.add(Duration(days: 3)));
    String thu = convertDateTimeToStirng(startOfweek.add(Duration(days: 4)));
    String fri = convertDateTimeToStirng(startOfweek.add(Duration(days: 5)));
    String sat = convertDateTimeToStirng(startOfweek.add(Duration(days: 6)));
    return Consumer<ExpenseData>(
      builder: (context, value, child) {
        print("${value.calculateDailyExpensiveSumanry()}" + "value in map");
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Week total:',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      '\$ ${calculateTotal(value, sun, mon, tue, wed, thu, fri, sat)}'),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: Mybargraph(
                  maxy: calculate(value, sun, mon, tue, wed, thu, fri, sat),
                  sunAmount: value.calculateDailyExpensiveSumanry()[sun] ?? 0,
                  monAmount: value.calculateDailyExpensiveSumanry()[mon] ?? 0,
                  tueAmount: value.calculateDailyExpensiveSumanry()[tue] ?? 0,
                  wedAmount: value.calculateDailyExpensiveSumanry()[wed] ?? 0,
                  thuAmount: value.calculateDailyExpensiveSumanry()[thu] ?? 0,
                  friAmount: value.calculateDailyExpensiveSumanry()[fri] ?? 0,
                  satAmount: value.calculateDailyExpensiveSumanry()[sat] ?? 0),
            ),
          ],
        );
      },
    );
  }
}
