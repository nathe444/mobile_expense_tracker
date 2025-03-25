import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense(this._addExpense, {super.key});
  final void Function(Expense expence) _addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory = Category.entertainment;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 100, now.month - 3, now.day - 24);
    final pickedDate =
        await showDatePicker(context: context, firstDate: firstDate, lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _categoryPicker(data) {
    setState(() {
      _selectedCategory = data;
    });
  }

  void _submitExpense(ctx) {
    final enteredAmount = double.tryParse(_amountController.text);
    final isAmountInvalid = enteredAmount == null || enteredAmount < 0;
    final enteredName = _titleController.text.trim();

    if (isAmountInvalid || enteredName.isEmpty || _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
                title: const Text('Invalid input'),
                content: const Text("Invalid title , amount or date was entered"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("Close"))
                ]);
          });
    }

    widget._addExpense(Expense(
        title: enteredName,
        date: _selectedDate!,
        amount: enteredAmount!,
        category: _selectedCategory!));

    Navigator.pop(ctx);

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(prefixText: '\$', label: Text("Amount")),
                  controller: _amountController,
                ),
              ),
              const SizedBox(
                width: 30.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? 'No date Selected'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                          value: category, child: Text(category.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    _categoryPicker(value);
                  }),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    _submitExpense(context);
                  },
                  child: const Text("Save Expense")),
            ],
          )
        ],
      ),
    );
  }
}
