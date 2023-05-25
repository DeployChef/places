import 'package:flutter/material.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final int currentScreenIndex;

  const MainBottomNavigationBar({Key? key, required this.currentScreenIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentScreenIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Список',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Карта',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Избранное',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Настройки',
        ),
      ],
    );
  }
}
