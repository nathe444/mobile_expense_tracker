import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, entertainment, work, transportation }

class Expense {
  Expense(
      {required this.title,
      required this.date,
      required this.amount,
      required this.category})
      : id = uuid.v4();

  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category;
}
