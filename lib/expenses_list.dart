import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({required this.expenses, super.key});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Text(
              expenses[index].title,
              style: const TextStyle(fontSize: 20.0, color: Colors.lightGreen),
            ));

    // return Row(
    //   children: [
    //     Text(expense.title,
    //         style: const TextStyle(fontSize: 18.00, color: Colors.amber)),
    //     Text(expense.date.toString(),
    //         style: const TextStyle(fontSize: 18.00, color: Colors.amber)),
    //     Text(expense.title,
    //         style: const TextStyle(fontSize: 18.00, color: Colors.amber)),
    //     Text(
    //       expense.amount.toString(),
    //       style: const TextStyle(fontSize: 18.00, color: Colors.amber),
    //     )
    //   ],
    // );
  }
}
