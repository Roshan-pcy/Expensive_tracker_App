import 'package:expensive_app_2/models/Expensive_Item.dart';
import 'package:flutter/material.dart';

class ExpenseData {
  //list of all expenses

  List<ExpensiveItem> overallExpensive_list = [];

  //get expenses list
  List<ExpensiveItem> getAllExpenseList() {
    return overallExpensive_list;
  }

  void AddNewExpense(ExpensiveItem expensiveItem) {
    overallExpensive_list.add(expensiveItem);
  }

  //delete expense
  String getDayName(DateTime datetime) {
    switch (datetime.weekday) {
      case 1:
        return 'mon';
      case 2:
        return 'tue';
      case 3:
        return 'wed';
      case 4:
        return 'thu';
      case 4:
        return 'fri';
      case 5:
        return 'sat';
      case 7:
        return 'sun';
      default:
        return '';
    }
  }

  //get weekday (mon,tues,ect) from a datetime object

  // get the date for the start of the week (sunday)
  // DateTime startOfWeekDate() {
  //   DateTime? startOfWeek;
  //   DateTime today = DateTime.now();
  // }

  /*convert overall list of expenses into a daily expense summary
e.g overallExpenseList 
= [[food,2023/01/30],[ect]]

DailyExpensiveSummary=[[2023/01/30]:$25]

  */
}
