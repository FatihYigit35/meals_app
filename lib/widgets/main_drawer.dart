import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer_list_title.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onClickSelectedDrawer,
  });

  final void Function(String selectedDrawer) onClickSelectedDrawer;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 16),
                Text(
                  'Cooking up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ],
            ),
          ),
          DrawerListTitle(
            icon: Icons.restaurant,
            title: 'Meals',
            onClickDrawerItem: () {
              onClickSelectedDrawer('meals');
            },
          ),
          DrawerListTitle(
            icon: Icons.filter_list,
            title: 'Filters',
            onClickDrawerItem: () {
              onClickSelectedDrawer('filters');
            },
          ),
        ],
      ),
    );
  }
}
