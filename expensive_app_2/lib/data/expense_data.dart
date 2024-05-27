import 'package:expensive_app_2/data/Hive_database.dart';
import 'package:expensive_app_2/datetime/date_time_helper.dart';
import 'package:expensive_app_2/models/Expensive_Item.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier {
  //list of all expenses

  List<ExpensiveItem> overallExpensive_list = [];

  //get expenses list
  List<ExpensiveItem> getAllExpenseList() {
    return overallExpensive_list;
  }

  //prepare to dispaly data
  final db = HiveDatabase();
  void prepareData() {
    if (db.readData().isNotEmpty) {
      overallExpensive_list = db.readData();
      print('called prepared data');
    }
  }

//add into list
  void AddNewExpense(ExpensiveItem expensiveItem) {
    overallExpensive_list.add(expensiveItem);
    notifyListeners();
    db.saveData(overallExpensive_list);
  }

  //delete into list
  void DeleteExpense(ExpensiveItem expensiveItem) {
    overallExpensive_list.remove(expensiveItem);
    notifyListeners();
    db.saveData(overallExpensive_list);

    ///added
  }

  //get weekday (mon,tues,ect) from a datetime object
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
      case 5:
        return 'fri';
      case 6:
        return 'sat';
      case 7:
        return 'sun';
      default:
        return '';
    }
  }

  // get the date for the start of the week (sunday)

  DateTime startOfWeekDate() {
    DateTime? startOfWeek;
    //get todays date
    // go backword to today to sunday
    DateTime today = DateTime.now();

    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'sun') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  /*convert overall list of expenses into a daily expense summary
e.g overallExpenseList 
= [[food,2023/01/30],[ect]]

DailyExpensiveSummary=[[2023/01/30]:$25]

  */

  Map<String, double> calculateDailyExpensiveSumanry() {
    Map<String, double> dailExpenseSumary = {};

    for (var expense in overallExpensive_list) {
      String date = convertDateTimeToStirng(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailExpenseSumary.containsKey(date)) {
        double currectAmount = dailExpenseSumary[date]!;
        currectAmount += amount;
        dailExpenseSumary[date] = currectAmount;
      } else {
        dailExpenseSumary.addAll({date: amount});
      }
    }
    return dailExpenseSumary;
  }
}
