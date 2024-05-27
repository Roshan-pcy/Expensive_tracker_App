import 'package:expensive_app_2/bargraph/mybargraph.dart';
import 'package:expensive_app_2/data/expense_data.dart';
import 'package:expensive_app_2/datetime/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExspensiveSummary extends StatelessWidget {
  final DateTime startOfweek;
  const ExspensiveSummary({super.key, required this.startOfweek});

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
        return SizedBox(
          height: 250,
          child: Mybargraph(
              maxy: 100,
              sunAmount: value.calculateDailyExpensiveSumanry()[sun] ?? 0,
              monAmount: value.calculateDailyExpensiveSumanry()[mon] ?? 0,
              tueAmount: value.calculateDailyExpensiveSumanry()[tue] ?? 0,
              wedAmount: value.calculateDailyExpensiveSumanry()[wed] ?? 0,
              thuAmount: value.calculateDailyExpensiveSumanry()[thu] ?? 0,
              friAmount: value.calculateDailyExpensiveSumanry()[fri] ?? 0,
              satAmount: value.calculateDailyExpensiveSumanry()[sat] ?? 0),
        );
      },
    );
  }
}
