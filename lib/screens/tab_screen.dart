import 'package:flutter/material.dart';
import 'package:meals_app/models/filter.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Meal> _favoriteMeals = [];
  final _textCategories = 'Categories';
  final _textFavorites = 'Favorites';
  int _selectedPageIndex = 0;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _changeMealFavoriteStatus(Meal meal) {
    final isFavorite = _favoriteMeals.contains(meal);

    if (isFavorite) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Meal is no longer available in favorites');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('Meal is now in your favorites');
      });
    }
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setDrawerScreen(String selectedDrawer) async {
    Navigator.of(context).pop();
    if (selectedDrawer == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      onChangeFavorite: _changeMealFavoriteStatus,
    );

    String activePageTitle = _textCategories;

    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(
        title: null,
        meals: _favoriteMeals,
        onChangeFavorite: _changeMealFavoriteStatus,
      );
      activePageTitle = _textFavorites;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onClickSelectedDrawer: _setDrawerScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _selectedPage(index),
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: _textCategories,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            label: _textFavorites,
          ),
        ],
      ),
    );
  }
}
