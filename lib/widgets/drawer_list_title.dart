import 'package:flutter/material.dart';

class DrawerListTitle extends StatelessWidget {
  const DrawerListTitle({
    super.key,
    required this.icon,
    required this.title,
    required this.onClickDrawerItem,
  });

  final IconData icon;
  final String title;
  final void Function() onClickDrawerItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 20,
            ),
      ),
      onTap: onClickDrawerItem,
    );
  }
}
