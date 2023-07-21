import 'package:expense_tracker/expense_item.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => ExpenseItem(expenses[index]));
  }
}
