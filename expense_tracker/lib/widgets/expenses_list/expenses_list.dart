import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;
  @override
  Widget build(context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: ((context, index) {
          return Dismissible(
              background: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(230, 230, 71, 59),
                ),
                
                margin: Theme.of(context).cardTheme.margin!,
              ),
              key: ValueKey(expenses[index]),
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
              },
              child: ExpenseItem(expense: expenses[index]));
        }));
  }
}
