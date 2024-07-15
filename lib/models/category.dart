import 'package:flutter/material.dart';

class Category {
  const Category(
      {required this.id, required this.title, this.color = Colors.green});

  final String id;
  final String title;
  final Color color;
}
