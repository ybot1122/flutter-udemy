import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.allExpenses, required this.removeExpense});

  final List<Expense> allExpenses;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allExpenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(allExpenses[index]),
        child: ExpenseItem(expense: allExpenses[index]),
        onDismissed: (direction) {
          removeExpense(allExpenses[index]);
        },
      ),
    );
  }
}
