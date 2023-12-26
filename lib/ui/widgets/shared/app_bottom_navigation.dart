import 'package:flutter/material.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_max_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken_outlined), label: ''),
      ],
    );
  }
}
