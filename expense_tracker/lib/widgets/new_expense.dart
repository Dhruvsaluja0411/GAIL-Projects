// import 'package:expense_tracker/data/expenses_data.dart';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
// import 'package:intl/intl.dart';

// final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedcategory = Category.leisure;

  void _presentDatePicker() async {
    final initialDate = DateTime.now();
    final firstDate =
        DateTime(initialDate.year - 20, initialDate.month, initialDate.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: initialDate,
    );
    // ).then((value){});
    setState(() {
      _selectedDate = pickedDate;
    });
  }
  void _showDialog()
  {
    if(Platform.isIOS)
    {
      showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text('Invalid Input'),
                content: const Text(
                    'Please make sure a valid Title, Amount, Date and Category was enetered.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('close'),
                  ),
                ],
              ));
    }
    else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Please make sure a valid Title, Amount, Date and Category was enetered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('close'),
            ),
          ],
        ),
      );
    }
      
  }
  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    // if tryParse('hello') => null if tryParse('1.12') => 1.12
    final amountIsInvalid = (enteredAmount == null) || (enteredAmount <= 0);
    if ((_titleController.text.trim().isEmpty) ||
        (amountIsInvalid) ||
        (_selectedDate == null)) {
      // show error message
      _showDialog();
      return;
    }
    // setState(() {
    //       expensesData.add(Expense(title: _titleController.text, amount: enteredAmount, date: _selectedDate!, category: _selectedcategory));

    // });
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedcategory));
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
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: ((context, constraints) {
      // print(constraints);
      // print(constraints.minHeight);
      // print(constraints.maxHeight);
      // print(constraints.minWidth);
      // print(constraints.maxWidth);

      final width = constraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, keyboardSpace + 20),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          // onChanged: _saveTitleInput,
                          controller: _titleController,
                          maxLength: 50,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            label: Text('Title'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '\$ ',
                            label: Text('Amount'),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    // onChanged: _saveTitleInput,
                    controller: _titleController,
                    maxLength: 50,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                    ),
                  ),
                if (width >= 600)
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedcategory,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() {
                            _selectedcategory = value;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_selectedDate == null
                              ? 'No Date selected'
                              : formatter.format(_selectedDate!)),
                          IconButton(
                            onPressed: _presentDatePicker,
                            icon: const Icon(Icons.calendar_month),
                          )
                        ],
                      ))
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '\$ ',
                            label: Text('Amount'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_selectedDate == null
                              ? 'No Date selected'
                              : formatter.format(_selectedDate!)),
                          IconButton(
                            onPressed: _presentDatePicker,
                            icon: const Icon(Icons.calendar_month),
                          )
                        ],
                      ))
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                if (width >= 600)
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        onPressed: _submitExpenseData,
                        child: const Text('Save Expense'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton(
                        value: _selectedcategory,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() {
                            _selectedcategory = value;
                          });
                        },
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: _submitExpenseData,
                        child: const Text('Save Expense'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    }));
  }
}
