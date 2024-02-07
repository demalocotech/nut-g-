import 'package:flutter/material.dart';
import 'package:nut_g/screens/home_screen.dart';
import 'package:nut_g/screens/widgets/nav_screens/cart_screen.dart';
import 'package:nut_g/screens/widgets/nav_screens/category_screen.dart';
import 'package:nut_g/screens/widgets/nav_screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  List<Widget> _pages = [
    HomePage(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        selectedItemColor: Color.fromARGB(255, 4, 54, 7),
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_max_outlined,
              size: 25,
              color: Colors.lightGreen.shade900,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category_outlined,
              size: 25,
              color: Colors.lightGreen.shade900,
            ),
            label: 'CATEGORY',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 25,
              color: Colors.lightGreen.shade900,
            ),
            label: 'CART',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              size: 25,
              color: Colors.lightGreen.shade900,
            ),
            label: 'PROFILE',
          ),
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}
