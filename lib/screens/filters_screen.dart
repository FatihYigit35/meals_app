import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/filter_switch_list_tile.dart';

import '../models/filter.dart';
// import 'package:meals_app/screens/tab_screen.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          FilterSwitchListTile(
            value: activeFilters[Filter.gluttenFree]!,
            onChanged: (newValue) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.gluttenFree, newValue),
            title: 'Glutten-free',
            subtitle: 'Only include glutten-free meals',
          ),
          FilterSwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (newValue) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, newValue),
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals',
          ),
          FilterSwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (newValue) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegetarian, newValue),
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
          ),
          FilterSwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (newValue) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegan, newValue),
            title: 'Vegam',
            subtitle: 'Only include vegam meals',
          ),
        ],
      ),
    );
  }
}
