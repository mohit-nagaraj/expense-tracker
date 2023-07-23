import 'package:expense_tracker/capitalize.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExpense extends StatefulWidget {
  NewExpense(this.addToList, {super.key});
  //pointing to func which can add
  void Function(Expense e) addToList;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectCategory;

  final now = DateTime.now();
  void _dateTimePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    bool validateAmount = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        validateAmount ||
        _selectedDate == null ||
        _selectCategory == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Row(
                  children: [
                    Text('Invalid Input'),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                        },
                        icon: Icon(Icons.close)),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        'Please make sure sure you enter all the fields in proper format.'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                            child: Text('Close'))
                      ],
                    )
                  ],
                ),
              ));
      return;
    }
    //made a class holding that values. use that add method here and pass the class
    widget.addToList(Expense(
      title: _titleController.text.trim(),
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectCategory!,
    ));
    //close the overlay after adding
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    //formmating for 2 decimals (double input)
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                  ],
                  decoration: const InputDecoration(
                      prefixText: '₹', label: Text('Amount')),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: _dateTimePicker,
                    icon: Icon(Icons.calendar_month),
                    label: Text(
                      _selectedDate == null
                          ? 'Select date'
                          : formatter.format(_selectedDate!),
                      style: TextStyle(
                        color: Color.fromARGB(186, 0, 0, 0),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      iconColor: Color.fromARGB(180, 0, 0, 0),
                    ),
                  )
                  /*
                  Text(_selectedDate == null
                      ? 'Select date'
                      : formatter.format(_selectedDate!)),
                  IconButton(
                      onPressed: _dateTimePicker,
                      icon: Icon(Icons.calendar_month)),*/
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                DropdownButton(
                    hint: Text('Category'),
                    padding: EdgeInsets.only(left: 10),
                    value: _selectCategory,
                    items: Category.values
                        .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.capitalize())))
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectCategory = value;
                      });
                    }),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                  onPressed: _submitExpenseData,
                  child: const Text('Submit'),
                  //style: ElevatedButton.styleFrom(
                  //  backgroundColor: Color.fromARGB(255, 178, 216, 223),
                  //),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
