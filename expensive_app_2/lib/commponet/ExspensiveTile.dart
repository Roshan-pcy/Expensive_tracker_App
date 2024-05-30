import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Exspensivetile extends StatelessWidget {
  //added
  final String name;
  final String amount;
  final DateTime dateTime;
  void Function(BuildContext) onpressed;
  Exspensivetile(
      {required this.name,
      required this.amount,
      required this.dateTime,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: onpressed,
          icon: Icons.delete,
          backgroundColor: Colors.red,
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[350], borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(name),
            subtitle:
                Text("${dateTime.day}/${dateTime.month}/${dateTime.year}"),
            trailing: Text("\$" + amount),
          ),
        ),
      ),
    );
  }
}
