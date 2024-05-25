import 'package:expensive_app_2/bargraph/mybargraph.dart';
import 'package:expensive_app_2/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExspensiveSummary extends StatelessWidget {
  final DateTime startOfweek;
  const ExspensiveSummary({super.key, required this.startOfweek});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) {
        return SizedBox(
          height: 200,
          child: Mybargraph(
              maxy: 100,
              sunAmount: 10,
              monAmount: 200,
              tueAmount: 300,
              wedAmount: 30,
              thuAmount: 50,
              friAmount: 60,
              satAmount: 50),
        );
      },
    );
  }
}
