import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

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
        title: 'Movie',
        date: DateTime.now(),
        amount: 250,
        category: Category.entertainment),
    Expense(title: 'burger', date: DateTime.now(), amount: 400, category: Category.food)
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(_addExpense);
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final index = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Expense was successfuly deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: "undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(index, expense);
              });
            }),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget home = const Center(
      child: Text("No expenses found.Start adding some"),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
              child: _registeredExpenses.isEmpty
                  ? home
                  : ExpensesList(
                      expenses: _registeredExpenses, removeExpense: _removeExpense))
        ],
      ),
    );
  }
}
