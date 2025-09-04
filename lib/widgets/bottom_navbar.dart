import 'package:flutter/material.dart';
import 'package:pet_adoption/theme/color.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: AppColor.actionColor,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        // Handle bottom navigation tap
      },
    );
  }
}
