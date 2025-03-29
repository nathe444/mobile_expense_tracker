import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({required this.expenses, required this.removeExpense, super.key});

  final List<Expense> expenses;
  final void Function(Expense removeExpense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            background: Container(
              color: const Color.fromARGB(255, 228, 162, 240).withOpacity(0.5),
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            onDismissed: (direction) {
              removeExpense(expenses[index]);
            },
            key: ValueKey(expenses[index]),
            child: ExpenseItem(expenses[index])));

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
