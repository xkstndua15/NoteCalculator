import 'package:flutter/material.dart';

AppBar mainAppBar(int tabNumber) {
  List _widgetOptions = [
    const Text(
      '노트',
      style: TextStyle(fontSize: 30),
    ),
    const Text(
      '계산기',
      style: TextStyle(fontSize: 30),
    ),
  ];
  return AppBar(
    elevation: 0,
    title: _widgetOptions[tabNumber],
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search_rounded,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.sort,
        ),
      )
    ],
  );
}
