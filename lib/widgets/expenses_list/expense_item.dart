import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 25.0),
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 5.00),
                    Text(
                      expense.formattedDate,
                      style: const TextStyle(color: Colors.black87),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
