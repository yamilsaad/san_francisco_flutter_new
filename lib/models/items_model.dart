import 'package:flutter/material.dart';

class Item {
  final String headerValue;
  final String expandedValue;
  bool isExpanded;

  Item({
    required this.headerValue,
    required this.expandedValue,
    required this.isExpanded,
  });
}
