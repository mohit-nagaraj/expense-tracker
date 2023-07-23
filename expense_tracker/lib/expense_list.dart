import 'package:expense_tracker/expense_item.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({
    super.key,
    required this.expenses,
    required this.removeList,
  });
  void Function(Expense e) removeList;
  final List<Expense> expenses;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            margin: EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 16,
            ),
            child: Icon(
              Icons.delete,
              color: Colors.white60,
            )),
        onDismissed: (direction) {
          removeList(expenses[index]);
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
