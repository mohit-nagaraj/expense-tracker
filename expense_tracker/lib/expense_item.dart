import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(height: 4),
            Row(
              children: [
                Text('₹ ${expense.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [
                    Text(expense.formatDate),
                    SizedBox(width: 4),
                    Icon(categoryIcons[expense.category]),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
