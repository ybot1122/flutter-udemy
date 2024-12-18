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
        background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            margin: Theme.of(context).cardTheme.margin!),
        onDismissed: (direction) {
          removeExpense(allExpenses[index]);
        },
        child: ExpenseItem(expense: allExpenses[index]),
      ),
    );
  }
}
