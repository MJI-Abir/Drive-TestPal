import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:drive_test_pal/core/utils/constants.dart';
import 'package:drive_test_pal/screens/home/presentation/screens/home.dart';
import 'package:drive_test_pal/screens/library/presentation/screens/library_page.dart';
import 'package:drive_test_pal/screens/profile/presentation/screens/profile_page.dart';
import 'package:drive_test_pal/screens/settings/presentation/screens/settings_page.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _activeIndex = 0;

  static const List<Widget> _widgetOptions = [
    Home(),
    LibraryPage(),
    ProfilePage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.black,
        child: Icon(Icons.dark_mode),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: kBottomNavIcons,
        backgroundColor: Colors.black87,
        inactiveColor: Colors.white,
        activeColor: kActiveColor,
        leftCornerRadius: 16,
        rightCornerRadius: 16,
        iconSize: 25,
        elevation: 6,
        gapLocation: GapLocation.center,
        activeIndex: _activeIndex,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_activeIndex),
    );
  }
}
