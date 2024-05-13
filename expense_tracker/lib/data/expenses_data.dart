import 'package:expense_tracker/models/expense.dart';

final expensesData = [
  Expense(
      title: 'flutter_course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Mumbai',
      amount: 30,
      date: DateTime.now(),
      category: Category.travel,
    ),
];