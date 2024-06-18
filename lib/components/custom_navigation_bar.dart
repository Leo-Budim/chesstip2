import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {

  BottomNavigation({this.selectedIndex, required this.onClicked});
  final selectedIndex;
  ValueChanged<int> onClicked;
  final double iconSize = 20;
  final double selectedFontSize = 12;
  final double unselectedFontSize = 8;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onClicked,

      type: BottomNavigationBarType.fixed,
      selectedFontSize: selectedFontSize,
      unselectedFontSize: unselectedFontSize,
      showUnselectedLabels: false,
      selectedItemColor: Colors.green,

      items: [
        BottomNavigationBarItem(
            icon: SizedBox(
              width: iconSize,
              child: Image.asset(
                "assets/icons/chess-white.png",
              ),
            ),
            activeIcon: SizedBox(
                width: iconSize,
                child: Image.asset(
                  color: Colors.green,
                  "assets/icons/chess-black.png",
                )),
            label: "Jogar"),
        BottomNavigationBarItem(
            icon: SizedBox(
              width: iconSize,
              child: Image.asset(
                "assets/icons/historical-white.png",
              ),
            ),
            activeIcon: SizedBox(
              width: iconSize,
              child: Image.asset(
                color: Colors.green,
                "assets/icons/historical-black.png",
              ),
            ),
            label: "Histórico"),
        BottomNavigationBarItem(
            icon: SizedBox(
              width: iconSize,
              child: Image.asset(
                "assets/icons/friends-white.png",
              ),
            ),
            activeIcon: SizedBox(
              width: iconSize,
              child: Image.asset(
                color: Colors.green,
                "assets/icons/friends-black.png",
              ),
            ),
            label: "Amigos"),
        BottomNavigationBarItem(
            icon: SizedBox(
              width: iconSize,
              child: Image.asset("assets/icons/gear-white.png"),
            ),
            activeIcon: SizedBox(
              width: iconSize,
              child: Image.asset(
                color: Colors.green,
                "assets/icons/gear-black.png",
              ),
            ),
            label: "Configurações")
      ],
    );
  }

}