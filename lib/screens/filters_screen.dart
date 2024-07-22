import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_switch_list_tile.dart';

import '../models/filter.dart';
// import 'package:meals_app/screens/tab_screen.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluttenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();

    _gluttenFreeFilterSet = widget.currentFilters[Filter.gluttenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      // drawer: MainDrawer(
      //   onClickSelectedDrawer: (selectedDrawer) {
      //     Navigator.of(context).pop();
      //     if (selectedDrawer == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (context) => const TabScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.gluttenFree: _gluttenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            FilterSwitchListTile(
              value: _gluttenFreeFilterSet,
              onChanged: (newValue) =>
                  setState(() => _gluttenFreeFilterSet = newValue),
              title: 'Glutten-free',
              subtitle: 'Only include glutten-free meals',
            ),
            FilterSwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (newValue) =>
                  setState(() => _lactoseFreeFilterSet = newValue),
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals',
            ),
            FilterSwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (newValue) =>
                  setState(() => _vegetarianFilterSet = newValue),
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
            ),
            FilterSwitchListTile(
              value: _veganFilterSet,
              onChanged: (newValue) =>
                  setState(() => _veganFilterSet = newValue),
              title: 'Vegam',
              subtitle: 'Only include vegam meals',
            ),
          ],
        ),
      ),
    );
  }
}
