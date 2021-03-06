import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:artryouts/Main%20Screen%20Pages/U_CartPage.dart';
import 'package:artryouts/Main%20Screen%20Pages/home_page.dart';
import 'package:artryouts/Main%20Screen%20Pages/search_page.dart';
import 'package:artryouts/Main%20Screen%20Pages/wishlist_page.dart';
import 'package:artryouts/utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> list = [Home(), SearchPage(), WishlistPage(), CartPage()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: list[_currentIndex],
      bottomNavigationBar: bottomNavBar(),
    );
  }

  BottomNavyBar bottomNavBar() {
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      containerHeight: 60,
      curve: Curves.easeIn,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      onItemSelected: (index) => setState(
        () {
          _currentIndex = index;
        },
      ),
      items: [
        BottomNavyBarItem(
          icon: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          activeColor: Colors.white,
          inactiveColor: Colors.white54,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.search),
          title: const Text('Search'),
          activeColor: Colors.white,
          inactiveColor: Colors.white54,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.favorite_outline_sharp),
          title: const Text('Wishlist'),
          activeColor: Colors.white,
          inactiveColor: Colors.white54,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.shopping_cart_outlined),
          title: const Text('Cart'),
          activeColor: Colors.white,
          inactiveColor: Colors.white54,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
