import 'package:flutter/material.dart';

class FilterSwitch extends StatelessWidget {
  const FilterSwitch(
      {super.key,
      required this.status,
      required this.toggle,
      required this.title,
      required this.subtitle});

  final bool status;
  final void Function(bool) toggle;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: status,
      onChanged: toggle,
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface)),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface, fontSize: 16),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
