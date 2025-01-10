import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/filter_switch.dart';
import 'package:meals/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _onlyLactoseFree = false;
  var _onlyVeg = false;
  var _onlyVegan = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _onlyLactoseFree = widget.currentFilters[Filter.lactoseFree]!;
    _onlyVeg = widget.currentFilters[Filter.vegetarian]!;
    _onlyVegan = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
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
            print(didPop);
            if (didPop) return;
            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _onlyLactoseFree,
              Filter.vegetarian: _onlyVeg,
              Filter.vegan: _onlyVegan,
            });
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
