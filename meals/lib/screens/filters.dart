import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';
import 'package:meals/widgets/filter_switch.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _onlyLactoseFree = false;
  var _onlyVeg = false;
  var _onlyVegan = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
    _onlyLactoseFree = activeFilters[Filter.lactoseFree]!;
    _onlyVeg = activeFilters[Filter.vegetarian]!;
    _onlyVegan = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(filtersProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        /*
        drawer: MainDrawer(onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'meals') {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const TabsScreen()));
          }
        }),
        */
        body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, dynamic result) {
            if (didPop) return;
            ref.read(filtersProvider.notifier).setFilters({
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _onlyLactoseFree,
              Filter.vegetarian: _onlyVeg,
              Filter.vegan: _onlyVegan,
            });
            Navigator.of(context).pop();
          },
          child: Column(
            children: [
              FilterSwitch(
                status: _glutenFreeFilterSet,
                toggle: (isChecked) {
                  setState(() {
                    _glutenFreeFilterSet = isChecked;
                  });
                },
                title: 'Gluten-free',
                subtitle: 'Only include gluten-free meals',
              ),
              FilterSwitch(
                status: _onlyLactoseFree,
                toggle: (isChecked) {
                  setState(() {
                    _onlyLactoseFree = isChecked;
                  });
                },
                title: 'Lactose-free',
                subtitle: 'Only include lactose-free meals',
              ),
              FilterSwitch(
                status: _onlyVeg,
                toggle: (isChecked) {
                  setState(() {
                    _onlyVeg = isChecked;
                  });
                },
                title: 'Vegetarian',
                subtitle: 'Only include vegetarian meals',
              ),
              FilterSwitch(
                status: _onlyVegan,
                toggle: (isChecked) {
                  setState(() {
                    _onlyVegan = isChecked;
                  });
                },
                title: 'Vegan',
                subtitle: 'Only include vegan meals',
              )
            ],
          ),
        ));
  }
}
