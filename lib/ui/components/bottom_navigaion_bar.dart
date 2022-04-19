import 'package:flutter/material.dart';
import 'package:places/styles/color_constants.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final int currentScreenIndex;

  const MainBottomNavigationBar({Key? key, required this.currentScreenIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.colorWhiteMain,
      unselectedItemColor: AppColors.colorWhiteSecondary,
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
