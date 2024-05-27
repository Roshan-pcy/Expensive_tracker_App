import 'package:expensive_app_2/commponet/ExspensiveTile.dart';
import 'package:expensive_app_2/commponet/exspensive_Summary.dart';
import 'package:expensive_app_2/data/expense_data.dart';
import 'package:expensive_app_2/datetime/date_time_helper.dart';
import 'package:expensive_app_2/models/Expensive_Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final expensiveName = TextEditingController();
  final expensiveAmount = TextEditingController();

  void addnewExpense() {
    showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AlertDialog(
            title: Text('Add expense'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: expensiveName,
                  decoration: InputDecoration(
                      hintText: 'item name', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Amount', border: OutlineInputBorder()),
                  controller: expensiveAmount,
                ),
              ],
            ),
            actions: [
              MaterialButton(
                onPressed: save,
                child: Text('save'),
              ),
              MaterialButton(
                onPressed: cancel,
                child: Text('cancel'),
              )
            ],
          ),
        );
      },
    );
  }

  //save
  void save() {
    //create a exsense
    ExpensiveItem expenseItem = ExpensiveItem(
        name: expensiveName.text,
        amount: expensiveAmount.text,
        dateTime: DateTime.now());
    // add new expense
    Provider.of<ExpenseData>(context, listen: false).AddNewExpense(expenseItem);
    Navigator.pop(context);
    expensiveName.clear();
    expensiveAmount.clear();
  }

//cancel
  void cancel() {
    expensiveName.clear();
    expensiveAmount.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) {
        return SafeArea(
          child: Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: addnewExpense,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.grey[200],
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ExspensiveSummary(
                      startOfweek: value.startOfWeekDate(),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: value.getAllExpenseList().length,
                    itemBuilder: (context, index) {
                      return Exspensivetile(
                        name: value.getAllExpenseList()[index].name,
                        amount: value.getAllExpenseList()[index].amount,
                        dateTime: value.getAllExpenseList()[index].dateTime,
                      );
                    },
                  ),
                ],
              )),
        );
      },
    );
  }
}
