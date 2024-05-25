import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

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
        return AlertDialog(
          title: Text('Add expense'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: expensiveName,
              ),
              TextField(
                controller: expensiveAmount,
              ),
            ],
          ),
          actions: [
            MaterialButton(onPressed: save),
            MaterialButton(onPressed: cancel)
          ],
        );
      },
    );
  }

  //save
  void save() {}
//cancel
  void cancel() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addnewExpense,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
