import 'package:expensive_app_2/models/Expensive_Item.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  final _myBox = Hive.box("expense_database");

// allexpense +[ExpenseItem(),ExspenseItem()]
//we need to convert into list of list and store into hive data base

  void saveData(List<ExpensiveItem> allExpense) {
    List<List<dynamic>> allExpensesFormatted = [];
    for (var expense in allExpense) {
      List<dynamic> expensseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime
      ];
      allExpensesFormatted.add(expensseFormatted);
    }
    _myBox.put('All_EXPENSIVE', allExpensesFormatted);
  }

  List<ExpensiveItem> readData() {
    List<ExpensiveItem> allExpense = [];
    List savedExpenses = _myBox.get('All_EXPENSIVE') ?? [];
    for (int i = 0; i < savedExpenses.length; i++) {
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];

      DateTime dateTime = savedExpenses[i][2];
      allExpense
          .add(ExpensiveItem(name: name, amount: amount, dateTime: dateTime));
    }
    return allExpense;
  }
}
