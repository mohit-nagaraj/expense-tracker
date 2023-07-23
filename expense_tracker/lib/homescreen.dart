import 'package:expense_tracker/expense_list.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 429.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 350.00,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  //function to add to this list
  void addToList(Expense e) {
    setState(() {
      _registeredExpenses.add(e);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(addToList),
    );
  }

  void removeList(Expense e) {
    final expenseIndex = _registeredExpenses.indexOf(e);
    setState(() {
      _registeredExpenses.remove(e);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: Text('Expense deleted'),
      action: SnackBarAction(
        label: '↻ Undo',
        onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, e);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget listScreen = Center(child: Text('No expenses found. Start adding!'));
    if (_registeredExpenses.isNotEmpty) {
      listScreen =
          ExpenseList(expenses: _registeredExpenses, removeList: removeList);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center, aligns wrt to its parent widget
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('The chart'),
          Expanded(
            child: listScreen,
          ),
        ],
      ),
    );
  }
}
