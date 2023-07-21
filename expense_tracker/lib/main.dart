import 'package:flutter/material.dart';
import 'package:expense_tracker/homescreen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Expenses(),
    ),
  );
}
